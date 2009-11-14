//
//  IMOkViewController.m
//  IMOk
//
//  Created by Eric Park on 11/13/09.
//  Copyright NASA Ames Research Center 2009. All rights reserved.
//

#import "IMOkViewController.h"

@implementation IMOkViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}


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
	[ageViewController release]; ageViewController = nil;
	[configViewController release]; configViewController = nil;

    [super dealloc];
}

#pragma mark Actual code stuff

-(IBAction)call911:(id)sender {
	// Okay, so it doesn't actually call 911. In fact, it calls your cell phone's customer service line. :P
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:611"]];
}

-(IBAction)iAmOkayButton:(id)sender {
	if (messageViewController == nil) {
		messageViewController = [[MessageViewController alloc] init];
	}
	[self presentModalViewController:messageViewController animated:YES];
}

-(IBAction)runSetup:(id)sender {
	if (configViewController == nil) {
		configViewController = [[ConfigViewController alloc] init];
	}
	[self presentModalViewController:configViewController animated:YES];
}

@end
