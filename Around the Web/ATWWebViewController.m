//
//  ATWWebViewController.m
//  Around the Web
//
//  Created by Mark Meyer on 2/4/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import "ATWWebViewController.h"
#import <Social/Social.h>

@interface ATWWebViewController ()

@end

@implementation ATWWebViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.site.siteUrl];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareTapped:(id)sender {
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    //Taken from Stack Overflow
    //http://stackoverflow.com/questions/2491410/get-current-url-of-uiwebview
    NSString *initTweet = [NSString stringWithFormat:@"%@", [self.webView stringByEvaluatingJavaScriptFromString:@"window.location"]];
    [tweetSheet setInitialText:initTweet];
    
    [self presentViewController:tweetSheet animated:YES completion:nil];
}

- (IBAction)refreshTapped:(UIBarButtonItem *)sender {
    [self.webView reload];
}

- (IBAction)backTapped:(UIBarButtonItem *)sender {
    [self.webView goBack];
}

- (IBAction)forwardTapped:(UIBarButtonItem *)sender {
    [self.webView goForward];
}
@end
