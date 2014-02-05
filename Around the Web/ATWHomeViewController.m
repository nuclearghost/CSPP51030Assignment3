//
//  ATWHomeViewController.m
//  Around the Web
//
//  Created by Mark Meyer on 2/4/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import "ATWHomeViewController.h"

@interface ATWHomeViewController ()

@end

@implementation ATWHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.sites = [[NSMutableArray alloc] initWithCapacity:6];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Sites" ofType:@"plist"];
    
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    ATWSites *site;
    for (int i = 0; i < 6; ++i) {
        site = [[ATWSites alloc] init];
        site.siteName = [plistDict objectForKey:[NSString stringWithFormat:@"name%d",i]];
        site.siteUrl = [plistDict objectForKey:[NSString stringWithFormat:@"url%d",i]];
        self.sites[i] = site;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
