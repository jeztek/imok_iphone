//
//  AreYouOldEnoughViewController.h
//  IMOk
//
//  Created by Hansel Chung on 11/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AreYouOldEnoughViewController : UIViewController {
	id delegate;
}
@property (nonatomic, assign) id delegate;

-(IBAction)userAnsweredYes:(id)sender;
-(IBAction)userAnsweredNo:(id)sender;

@end
