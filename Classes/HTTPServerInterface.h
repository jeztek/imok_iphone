//
//  HTTPServerInterface.h
//  IMOk
//
//  Created by Hansel Chung on 11/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HTTPServerInterface : NSObject {

}

+ (HTTPServerInterface*)sharedInstance;
- (NSString*)sendHTTPPost:(NSURL*)url withStringBody:(NSString*)body;

@end
