//
//  DeviceMotionViewController.m
//  GetMoving
//
//  Created by Thomas Ortega II on 8/16/15.
//  Copyright © 2015 Tom Ortega. All rights reserved.
//

#import "DeviceMotionViewController.h"

@interface DeviceMotionViewController ()

@end

@implementation DeviceMotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.motionManager = [[CMMotionManager alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDeviceMotion:(id)sender {
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        NSString *deviceMotionString = @"";
        if (self.motionManager.isAccelerometerAvailable) {
            deviceMotionString = [deviceMotionString stringByAppendingFormat:@"Attitude - roll: %f, pitch: %f, yaw: %f \n", motion.attitude.roll, motion.attitude.pitch, motion.attitude.yaw];
            deviceMotionString = [deviceMotionString stringByAppendingFormat:@"Rotation - x: %f, y: %f, z: %f \n", motion.rotationRate.x, motion.rotationRate.y, motion.rotationRate.z];
            deviceMotionString = [deviceMotionString stringByAppendingFormat:@"Gravity - x: %f, y: %f, z: %f \n", motion.gravity.x, motion.gravity.y, motion.gravity.z];
            deviceMotionString = [deviceMotionString stringByAppendingFormat:@"User Acceleration - x: %f, y: %f, z: %f \n", motion.userAcceleration.x, motion.userAcceleration.y, motion.userAcceleration.z];
        } else {
            deviceMotionString = @"No Motion detected";
        }
        self.deviceMotionLabel.text = deviceMotionString;

    }];
}

- (IBAction)stopDeviceMotion:(id)sender {
    [self.motionManager stopDeviceMotionUpdates];
    self.deviceMotionLabel.text = @"Not currently reading updates.";
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
