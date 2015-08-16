//
//  ActivityViewController.h
//  GetMoving
//
//  Created by Thomas Ortega II on 8/15/15.
//  Copyright © 2015 Tom Ortega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ActivityViewController : UIViewController

@property CMMotionActivityManager *activityManager;
@property IBOutlet UILabel *activityLabel;

- (IBAction)startActivityManager:(id)sender;
- (IBAction)stopActivityManager:(id)sender;

@end
