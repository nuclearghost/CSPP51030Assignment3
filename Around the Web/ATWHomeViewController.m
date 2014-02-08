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
    
    ATWSplashScreenViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"SplashScreenViewController"];
    
    [self presentViewController:vc animated:NO completion: nil];
    
    CGRect bounds = [self.view bounds];
    CGRect  viewRect = CGRectMake(0, 100, bounds.size.width, bounds.size.height/3);
    ATWCircleView *circleView =[[ATWCircleView alloc] initWithFrame:viewRect];
    [self.view addSubview:circleView];
    
    [self initURLs];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initURLs
{
    self.sites = [[NSMutableArray alloc] initWithCapacity:6];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Sites" ofType:@"plist"];
    
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    ATWSites *site;
    SEL buttonTappedSel = NSSelectorFromString(@"urlTapped:");
    
    for (int i = 0; i < 6; ++i) {
        site = [[ATWSites alloc] init];
        site.siteName = [plistDict objectForKey:[NSString stringWithFormat:@"name%d",i]];
        site.siteUrl = [NSURL URLWithString:[plistDict objectForKey:[NSString stringWithFormat:@"url%d",i]]];
        self.sites[i] = site;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        btn.frame = CGRectMake(i%2*130 + 20, i/2 * 30 + 280, 150, 40);
        
        [btn setTitle:site.siteName forState:UIControlStateNormal];
        [btn addTarget:self action:buttonTappedSel forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        
        [self.view addSubview:btn];
    }
}

- (void)urlTapped:(id)sender{
    [self performSegueWithIdentifier:@"segueWebView" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    ATWSites *site = [self.sites objectAtIndex:button.tag];
    
    if ([segue.identifier isEqualToString:@"segueWebView"]) {
        
        ATWWebViewController *wvc = (ATWWebViewController*)segue.destinationViewController;
        wvc.site = site;
    }
}

@end
