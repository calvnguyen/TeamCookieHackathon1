//
//  LKDistanceViewController.m
//  CMPedoMeterTrial
//
//  Created by MRTailor on 3/3/17.
//  Copyright © 2017 Orion info solution. All rights reserved.
//

#import "LKDistanceViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface LKDistanceViewController ()
@property (nonatomic, strong) CMPedometer    *pedometer;

@end

@implementation LKDistanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    if ([CMPedometer isStepCountingAvailable]) {
        self.pedometer = [[CMPedometer alloc] init];
        [NSTimer scheduledTimerWithTimeInterval:0.5f
                                         target:self
                                       selector:@selector(recursiveQuery)
                                       userInfo:nil
                                        repeats:YES];
    } else {
        NSLog(@"Nothing available");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ninja Motion" message:@"Ninja Motion nothing available for your device." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.pedometer startPedometerUpdatesFromDate:[NSDate date]
                                      withHandler:^(CMPedometerData *pedometerData, NSError *error) {
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              NSLog(@"data:%@, error:%@", pedometerData, error);
                                          });
                                      }];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.pedometer stopPedometerUpdates];
}
- (NSString *)stringWithObject:(id)obj {
    return [NSString stringWithFormat:@"%@", obj];
}

- (NSString *)stringForDate:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    
    return [formatter stringFromDate:date];
}

- (void)queryDataFrom:(NSDate *)startDate toDate:(NSDate *)endDate {
    [self.pedometer queryPedometerDataFromDate:startDate
                                        toDate:endDate
                                   withHandler:
     ^(CMPedometerData *pedometerData, NSError *error) {
         
         NSLog(@"data:%@, error:%@", pedometerData, error);
         
         dispatch_async(dispatch_get_main_queue(), ^{
             if (error) {
                 NSLog(@"Error = %@",error.userInfo);
                 //self.stepsLabel.text= [NSString stringWithFormat:@"Error = %@",error.userInfo];
             } else {
                 NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
                 [userInfo setObject:[self stringWithObject:pedometerData.numberOfSteps] forKey:@"numberOfSteps"];
                 [userInfo setObject:[NSString stringWithFormat:@"%.1f",[pedometerData.distance floatValue]] forKey:@"distance"];
                 [userInfo setObject:[self stringForDate:pedometerData.startDate] forKey:@"startDate"];
                 [userInfo setObject:[self stringForDate:pedometerData.endDate] forKey:@"endDate"];
                 [userInfo setObject:[self stringWithObject:pedometerData.floorsAscended] forKey:@"floorsAscended"];
                 [userInfo setObject:[self stringWithObject:pedometerData.floorsDescended] forKey:@"floorsDescended"];
                 [userInfo setObject:pedometerData forKey:@"pedometerData"];

                 [[NSNotificationCenter defaultCenter] postNotificationName:
                  @"LKDistanceViewController" object:nil userInfo:userInfo];
                 
             }
         });
     }];
}

- (void)recursiveQuery {
    NSDate *to   = [NSDate date];
    NSDate *from = [to dateByAddingTimeInterval:-(24. * 3600.)];
    [self queryDataFrom:from toDate:to];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
