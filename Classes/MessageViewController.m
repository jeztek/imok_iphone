//
//  MessageViewController.m
//  IMOk
//
//  Created by Hansel Chung on 11/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MessageViewController.h"
#import "LCCoreLocationDelegate.h"
#import "HTTPServerInterface.h"

@implementation MessageViewController

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

-(IBAction)sendMessage:(id)sender {
	CLLocation* location = [[LCCoreLocationDelegate sharedInstance] locationManager].location;
	NSLog(@"newLocationUpdate: %@", location);

	NSString* serverHostName = @"imok.jeztek.com";
	
	
	NSString *urlString = [NSString stringWithFormat:@"http://%@/%@/?firstname=%@&lastname=%@&lat=%f&lon=%f&time=%f&phonenumber=%@",
						   serverHostName,
						   [[NSUserDefaults standardUserDefaults] stringForKey:@"userKey"],
						   [[NSUserDefaults standardUserDefaults] stringForKey:@"firstName"],
						   [[NSUserDefaults standardUserDefaults] stringForKey:@"lastName"],
						   [location coordinate].latitude,
						   [location coordinate].longitude,
						   [NSDate timeIntervalSinceReferenceDate],
						   [[NSUserDefaults standardUserDefaults] stringForKey:@"phoneNumber"]];
	NSURL *url = [NSURL URLWithString:urlString];
	
	[[HTTPServerInterface sharedInstance] sendHTTPPost:url withStringBody:@""];
	
}

-(IBAction)updatePosition:(id)sender {
	[[LCCoreLocationDelegate sharedInstance] setDelegate:self];
	[[LCCoreLocationDelegate sharedInstance].locationManager startUpdatingLocation];
}

-(void)newLocationUpdate:(CLLocation *)location {
	NSLog(@"newLocationUpdate: %@", location);
	positionLabel.text = [NSString stringWithFormat:@"Latitude:%f Long:%f", location.coordinate.latitude, location.coordinate.longitude];
}

@end
