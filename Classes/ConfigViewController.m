//
//  ConfigViewController.m
//  IMOk
//
//  Created by Hansel Chung on 11/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ConfigViewController.h"


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
	if (firstNameField.text == nil)
		firstNameField.text = @"";
	
	if (lastNameField.text == nil)
		lastNameField.text = @"";
	
	if (phoneNumberField.text == nil)
		phoneNumberField.text = @"";
	
	if (userKeyField.text == nil)
		userKeyField.text = @"";
	
	[[NSUserDefaults standardUserDefaults] setValue:firstNameField.text forKey:@"firstName"];
	[[NSUserDefaults standardUserDefaults] setValue:lastNameField.text forKey:@"lastName"];
	[[NSUserDefaults standardUserDefaults] setValue:phoneNumberField.text forKey:@"phoneNumber"];
	[[NSUserDefaults standardUserDefaults] setValue:userKeyField.text forKey:@"userKey"];

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
