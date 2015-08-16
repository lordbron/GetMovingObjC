//
//  PedometerViewController.m
//  GetMoving
//
//  Created by Thomas Ortega II on 8/15/15.
//  Copyright © 2015 Tom Ortega. All rights reserved.
//

#import "PedometerViewController.h"

@interface PedometerViewController ()

@end

@implementation PedometerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([CMPedometer isStepCountingAvailable]) {
        self.localPedometer = [[CMPedometer alloc] init];
    } else {
        self.pedometerLabel.text = @"No pedometer data availabe.";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startPedometer:(id)sender {
    [self.localPedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        self.pedometerLabel.text = [NSString stringWithFormat:@"%@ steps and %@ distance since %@", pedometerData.numberOfSteps, pedometerData.distance,[NSDateFormatter localizedStringFromDate:pedometerData.startDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterMediumStyle]];
    }];
}

- (IBAction)stopPedometer:(id)sender {
    [self.localPedometer stopPedometerUpdates];
    self.pedometerLabel.text = @"Not currently reading updates.";
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
