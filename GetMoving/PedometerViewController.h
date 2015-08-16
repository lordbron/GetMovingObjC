//
//  PedometerViewController.h
//  GetMoving
//
//  Created by Thomas Ortega II on 8/15/15.
//  Copyright © 2015 Tom Ortega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface PedometerViewController : UIViewController

@property IBOutlet UILabel *pedometerLabel;
@property CMPedometer *localPedometer;

- (IBAction)startPedometer:(id)sender;
- (IBAction)stopPedometer:(id)sender;


@end
