//
//  View.m
//  Nov29
//
//  Created by Leonardo Lavega on 12/12/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import "View.h"
#import "ColorContainer.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		
		self.backgroundColor = [UIColor whiteColor];
		
		//creating label
		NSString *labelText = @"Choose your own Color";
		CGSize labelSize = [labelText sizeWithFont:[UIFont boldSystemFontOfSize:25]];
		label = [[UILabel alloc] initWithFrame: CGRectMake((self.bounds.size.width - labelSize.width)/2, 10, labelSize.width,labelSize.height)];
		label.font = [UIFont boldSystemFontOfSize:25];
		label.text = labelText;
		[self addSubview: label];
		
		//creating view that will display the current color
		
		float offset = 50;
		CGRect containerRect = CGRectMake(offset, 60, self.bounds.size.width - 2*offset, self.bounds.size.width - 2*offset);
		container = [[ColorContainer alloc] initWithFrame:containerRect];
		[self addSubview:container];
		
		
		//creating the label that will display the current values for each color channel
		
		NSString *rgbText = [NSString stringWithFormat:@"Red:%03d Green:%03d Blue:%03d",0,0,0];
		CGSize rgbSize = [rgbText sizeWithFont:[UIFont systemFontOfSize:15]];
		CGRect rgbFrame = CGRectMake((self.bounds.size.width - rgbSize.width)/2,
									 containerRect.size.height + containerRect.origin.y + 10,
									 rgbSize.width,
									 rgbSize.height);
		
		rgbInfo = [[UILabel alloc] initWithFrame:rgbFrame];
		rgbInfo.font = [UIFont systemFontOfSize:15];
		rgbInfo.text = rgbText;
		[self addSubview: rgbInfo];
		
		
		
		//creating the three sliders
		
		float minimumValue = 0;
		float maximumValue = 255;
		
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(maximumValue - minimumValue, 16);
		CGRect frameRed = CGRectMake(
							  b.origin.x + (b.size.width - s.width) / 2,
							  rgbFrame.origin.y + rgbFrame.size.height + 8,
							  s.width,
							  s.height
							  );
		
		redSlider = [[UISlider alloc] initWithFrame: frameRed];
		redSlider.minimumValue = minimumValue;
		redSlider.maximumValue = maximumValue;
		redSlider.value = 0;
		redSlider.continuous = YES;
		redSlider.backgroundColor = [UIColor redColor];
		[redSlider addTarget:self action:@selector(updateColor:) forControlEvents:UIControlEventValueChanged];
		
		CGRect frameBlue = CGRectMake(
							  b.origin.x + (b.size.width - s.width) / 2,
							  frameRed.origin.y + frameRed.size.height + 8,
							  s.width,
							  s.height
							  );
		
		blueSlider = [[UISlider alloc] initWithFrame: frameBlue];
		blueSlider.minimumValue = minimumValue;
		blueSlider.maximumValue = maximumValue;
		blueSlider.value = 0;
		blueSlider.continuous = YES;
		blueSlider.backgroundColor = [UIColor blueColor];
		[blueSlider addTarget:self action:@selector(updateColor:) forControlEvents:UIControlEventValueChanged];
		
		CGRect frameGreen = CGRectMake(
									  b.origin.x + (b.size.width - s.width) / 2,
									  frameBlue.origin.y + frameBlue.size.height + 8,
									  s.width,
									  s.height
									  );
		
		greenSlider = [[UISlider alloc] initWithFrame: frameGreen];
		greenSlider.minimumValue = minimumValue;
		greenSlider.maximumValue = maximumValue;
		greenSlider.value = 0;
		greenSlider.continuous = YES;
		greenSlider.backgroundColor = [UIColor greenColor];
		[greenSlider addTarget:self action:@selector(updateColor:) forControlEvents:UIControlEventValueChanged];
		
		[self addSubview:redSlider];
		[self addSubview:blueSlider];
		[self addSubview:greenSlider];
		
		//creating button
		
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		CGSize size = CGSizeMake(180, 30);
		button.frame = CGRectMake(
								  (self.bounds.size.width - size.width)/2,
								  self.bounds.size.height - size.height - 10,
								  size.width,
								  size.height
								  );
		
		[button setTitle: @"Reset to Default Values" forState: UIControlStateNormal];
		
		[button addTarget: [UIApplication sharedApplication].delegate
				   action: @selector(touchUpInside:)
		 forControlEvents: UIControlEventTouchUpInside
		 ];
		
		[self addSubview: button];
        
    }
    return self;
}

- (void) updateColor: (id) slider{
	
	NSString *rgbText = [NSString stringWithFormat:@"Red:%03d Green:%03d Blue:%03d",
						 (int)redSlider.value, (int)greenSlider.value, (int)blueSlider.value];
	rgbInfo.text = rgbText;
	//the values need to be adjusted since the CGContextRGBFill.. values for each channel
	//will range from 0 to 1 (instead of 0 to 255)
	[container setR:redSlider.value/255 G:greenSlider.value/255 B:blueSlider.value/255];
}

- (void) resetColor{
	
	rgbInfo.text = [NSString stringWithFormat:@"Red:%03d Green:%03d Blue:%03d",0,0,0];
	
	redSlider.value = 0;
	blueSlider.value = 0;
	greenSlider.value = 0;
	
	[container setR:0 G:0 B:0];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
