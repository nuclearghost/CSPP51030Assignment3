//
//  ATWSplashScreenViewController.m
//  Around the Web
//
//  Created by Mark Meyer on 2/4/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import "ATWSplashScreenViewController.h"

@interface ATWSplashScreenViewController ()

@end

@implementation ATWSplashScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SEL sel = NSSelectorFromString(@"dismiss");
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:sel userInfo:nil repeats:NO];
    NSLog(@"%@", timer.fireDate);
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
                      
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
