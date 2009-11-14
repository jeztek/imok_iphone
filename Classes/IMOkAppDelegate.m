//
//  IMOkAppDelegate.m
//  IMOk
//
//  Created by Eric Park on 11/13/09.
//  Copyright NASA Ames Research Center 2009. All rights reserved.
//

#import "IMOkAppDelegate.h"
#import "IMOkViewController.h"

#import "LCCoreLocationDelegate.h"

@implementation IMOkAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	[[LCCoreLocationDelegate sharedInstance] setDelegate:viewController];

	NSString* firstName = [[NSUserDefaults standardUserDefaults] stringForKey:@"userKey"];
	if ([firstName length] == 0) {
		// Hey.... we should ask the user for their info since we don't have any of it. :P
		[viewController performSelector:@selector(runSetup:) withObject:nil];
	}
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[LCCoreLocationDelegate sharedInstance].locationManager stopUpdatingLocation];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
