//
//  Nov29AppDelegate.h
//  Nov29
//
//  Created by Leonardo Lavega on 12/12/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Nov29AppDelegate : UIResponder <UIApplicationDelegate>{
	View *view;
}

- (void) touchUpInside: (id) sender;

@property (strong, nonatomic) UIWindow *window;

@end
