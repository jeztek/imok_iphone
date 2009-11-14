//
//  HTTPServerInterface.m
//  IMOk
//
//  Created by Hansel Chung on 11/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "HTTPServerInterface.h"

static HTTPServerInterface* sharedInstance = nil;

@implementation HTTPServerInterface

+ (HTTPServerInterface*)sharedInstance {
	if (sharedInstance == nil)
		sharedInstance = [[HTTPServerInterface alloc] init];
	return sharedInstance;
}

- (id) init {
	self = [super init];
	if (self != nil) {
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

- (NSString*)sendHTTPPost:(NSURL*)url withStringBody:(NSString*)body {
	// Send via HTTP POST
	NSData *postData = [body dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:url];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/xml; charset=\"utf-8\"" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	NSURLResponse *resp = nil;
	NSError *err = nil;
	
	NSData* urlReturnData = [[NSURLConnection sendSynchronousRequest:request returningResponse:&resp error:&err] retain];
	NSString* result = nil;
	if (urlReturnData == nil) {
		NSLog(@"No return data from URL.");
	}
	else {
		result = [[[NSString alloc] initWithData:urlReturnData encoding:NSUTF8StringEncoding] autorelease];
	}
	[urlReturnData release];
	
	[request release];	
	return result;
}

#pragma mark ---- singleton object methods ----

// See "Creating a Singleton Instance" in the Cocoa Fundamentals Guide for more info
- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  // denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}

@end
