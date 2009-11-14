//
//  MessageViewController.h
//  IMOk
//
//  Created by Hansel Chung on 11/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MessageViewController : UIViewController {
	IBOutlet UILabel* positionLabel;
}

-(IBAction)sendMessage:(id)sender;
-(IBAction)updatePosition:(id)sender;


@end
