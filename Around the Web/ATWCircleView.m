//
//  ATWCircleView.m
//  Around the Web
//
//  Created by Mark Meyer on 2/8/14.
//  Copyright (c) 2014 Mark Meyer. All rights reserved.
//

#import "ATWCircleView.h"

@implementation ATWCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    CGContextSaveGState(ctx);
    
    CGContextSetLineWidth(ctx,10);
    CGContextSetRGBStrokeColor(ctx,1.0,1.0,0.0,1.0);
    CGContextAddArc(ctx,center.x,center.y,60,0.0,M_PI*2,YES);
    CGContextStrokePath(ctx);
}


@end
