//
//  ConfigViewController.h
//  IMOk
//
//  Created by Hansel Chung on 11/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ConfigViewController : UIViewController {
	IBOutlet UITextField* firstNameField;
	IBOutlet UITextField* lastNameField;
	IBOutlet UITextField* phoneNumberField;
	IBOutlet UITextField* userKeyField;

}

-(IBAction)commitPrefs:(id)sender;


@end
