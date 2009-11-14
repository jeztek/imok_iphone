//
//  IMOkAppDelegate.h
//  IMOk
//
//  Created by Eric Park on 11/13/09.
//  Copyright NASA Ames Research Center 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IMOkViewController;

@interface IMOkAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IMOkViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet IMOkViewController *viewController;

@end

