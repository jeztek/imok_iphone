//
//  ConfigViewController.m
//  IMOk
//
//  Created by Hansel Chung on 11/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ConfigViewController.h"
#import "HTTPServerInterface.h"
#import "JSON.h"

@implementation ConfigViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark Actions

-(IBAction)commitPrefs:(id)sender {
	[spinner startAnimating];
	
	if (userKeyField.text == nil)
		userKeyField.text = @"";
	
	/*
	 Registration:
	 http://imok.jeztek.com/data/register/<user id>/
	 
	 Response:
	 {"result" : True, "first_name" : "Tom", "last_name" : "Jones"}
	 {"result" : False}
	 */
	
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://imok.jeztek.com/data/register/%@/", userKeyField.text]];
	NSString* returnText = [[HTTPServerInterface sharedInstance] sendHTTPPost:url withStringBody:@""];
	
	id jsonValue = [returnText JSONValue];
	NSLog(@"jsonString: @%", jsonValue);
	
	if ([jsonValue boolForKey:@"result"]) {
		// Success!
		[[NSUserDefaults standardUserDefaults] setValue:userKeyField.text forKey:@"userKey"];
		[[NSUserDefaults standardUserDefaults] setValue:[jsonValue valueForKey:@"first_name"] forKey:@"firstName"];
		[[NSUserDefaults standardUserDefaults] setValue:[jsonValue valueForKey:@"last_name"] forKey:@"lastName"];

		UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"You're confirmed!"
															message:[NSString stringWithFormat:@"Thanks, %@!", [jsonValue valueForKey:@"first_name"]]
														   delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
	else {
		// Fail :(
		[[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"userKey"];
		
		UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Oops!"
															message:@"Sorry, the confirmation key didn't seem to work. Please try again."
														   delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	[spinner stopAnimating];
	if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"userKey"] length] > 0)
		[self dismissModalViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	//http://blog.costan.us/2009/01/dismissing-virtual-keyboard-on-iphone.html
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]])
			[view resignFirstResponder];
	}
}

@end
