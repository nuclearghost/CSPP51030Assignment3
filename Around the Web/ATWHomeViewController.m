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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)urlTapped:(id)sender{
    NSLog(@"Url tapped");
    
    [self performSegueWithIdentifier:@"segueWebView" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Cast the parameter "sender" to a UIButton
    UIButton *button = (UIButton*)sender;
    
    ATWSites *site = [self.sites objectAtIndex:button.tag];
    
    // Test for the segue we expect; useful if you have different segue possible
    if ([segue.identifier isEqualToString:@"segueWebView"]) {
        
        // Get a pointer to the view controller that will be appear
        ATWWebViewController *wvc = (ATWWebViewController*)segue.destinationViewController;
        
        // Set the animal view controller's animal property to the current animala
        wvc.site = site;
    }
}

@end
