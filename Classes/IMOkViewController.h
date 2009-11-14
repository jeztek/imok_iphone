//
//  IMOkViewController.h
//  IMOk
//
//  Created by Eric Park on 11/13/09.
//  Copyright NASA Ames Research Center 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AreYouOldEnoughViewController.h"
#import "ConfigViewController.h"
#import "MessageViewController.h"

@interface IMOkViewController : UIViewController {
	AreYouOldEnoughViewController* ageViewController;
	ConfigViewController* configViewController;
	MessageViewController* messageViewController;
	
	IBOutlet UIActivityIndicatorView* spinner;
}

-(IBAction)call911:(id)sender;
-(IBAction)iAmOkayButton:(id)sender;
-(IBAction)runSetup:(id)sender;

@end

