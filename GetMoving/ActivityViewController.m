//
//  ActivityViewController.m
//  GetMoving
//
//  Created by Thomas Ortega II on 8/15/15.
//  Copyright © 2015 Tom Ortega. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([CMMotionActivityManager isActivityAvailable]) {
        self.activityManager = [[CMMotionActivityManager alloc] init];
    } else {
        self.activityLabel.text = @"Motion Activity Manger Unavailable.";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startActivityManager:(id)sender {
    [self.activityManager startActivityUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMotionActivity * _Nullable activity) {
        NSString *activityString = @"";
        if (activity.automotive) {
            activityString = [activityString stringByAppendingFormat:@"riding car with confidence of %ld \n",activity.confidence];
        }
        if (activity.cycling) {
            activityString = [activityString stringByAppendingFormat:@"cycling with confidence of %ld \n", activity.confidence];
        }
        if (activity.running) {
            activityString = [activityString stringByAppendingFormat:@"running with confidence of %ld \n", activity.confidence];
        }
        if (activity.stationary) {
            activityString = [activityString stringByAppendingFormat:@"stationary with confidence of %ld \n", activity.confidence];
        }
        if (activity.unknown) {
            activityString = [activityString stringByAppendingFormat:@"unknown with confidence of %ld \n", activity.confidence];
        }
        if (activity.walking) {
            activityString = [activityString stringByAppendingFormat:@"walking with confidence of %ld \n", activity.confidence];
        }
        if ([activityString isEqualToString:@""]) {
            activityString = @"No Activity detected";
        }
        self.activityLabel.text = activityString;
    }];
}

-(IBAction)stopActivityManager:(id)sender {
    [self.activityManager stopActivityUpdates];
    self.activityLabel.text = @"Not currently reading updates.";
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
