//
//  ATWHomeViewController.h
//  Around the Web
//
//  Created by Mark Meyer on 2/4/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATWSites.h"
#import "ATWWebViewController.h"

@interface ATWHomeViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *sites;

- (void)urlTapped:(id)sender;

@end
