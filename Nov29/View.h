//
//  View.h
//  Nov29
//
//  Created by Leonardo Lavega on 12/12/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ColorContainer;

@interface View : UIView{
	
	UILabel *label;
	ColorContainer *container;
	UILabel *rgbInfo;
	UISlider *redSlider;
	UISlider *blueSlider;
	UISlider *greenSlider;
	UIButton *button;
	
}

-(void)resetColor;

@end
