//
//  ColorContainer.m
//  Nov29
//
//  Created by Leonardo Lavega on 12/12/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import "ColorContainer.h"

@implementation ColorContainer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor whiteColor];
		red = blue = green = 0.0;
    }
    return self;
}

-(void)setR: (float)r G: (float)g B: (float)b{
	red =r;
	blue = b;
	green = g;
	[self setNeedsDisplay];

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	CGRect bounds = self.bounds;
	CGFloat radius = .5 * bounds.size.width;	//in pixels
	CGRect r = CGRectMake(
						  (bounds.origin.x + bounds.size.width)/2 - radius,
						  (bounds.origin.y + bounds.size.height)/2 - radius,
						  2 * radius,
						  2 * radius
						  );
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
	CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, red, green, blue, 1.0);
	CGContextFillPath(c);
    
}


@end
