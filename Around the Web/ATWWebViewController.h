//
//  ATWWebViewController.h
//  Around the Web
//
//  Created by Mark Meyer on 2/4/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATWSites.h"

@interface ATWWebViewController : UIViewController

@property (nonatomic, strong) ATWSites *site;


@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)shareTapped:(id)sender;

- (IBAction)refreshTapped:(UIBarButtonItem *)sender;
- (IBAction)backTapped:(UIBarButtonItem *)sender;
- (IBAction)forwardTapped:(UIBarButtonItem *)sender;

@end
