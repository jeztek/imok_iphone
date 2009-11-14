//
//  LCCoreLocationDelegate.h
//  Done
//
//  Created by Hansel Chung on 10/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface NSObject (CLLocationManagerDelegateDelegate)
-(void)newLocationUpdate:(CLLocation *)location;
@end

@interface LCCoreLocationDelegate : NSObject <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	id delegate;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic,assign) id delegate;


- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error;

+ (LCCoreLocationDelegate *)sharedInstance;

@end
