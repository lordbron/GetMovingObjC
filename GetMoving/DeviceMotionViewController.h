//
//  DeviceMotionViewController.h
//  GetMoving
//
//  Created by Thomas Ortega II on 8/16/15.
//  Copyright © 2015 Tom Ortega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface DeviceMotionViewController : UIViewController
@property IBOutlet UILabel *deviceMotionLabel;
@property CMMotionManager *motionManager;

- (IBAction)startDeviceMotion:(id)sender;
- (IBAction)stopDeviceMotion:(id)sender;

@end
