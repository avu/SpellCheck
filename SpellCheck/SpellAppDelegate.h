//
//  SpellAppDelegate.h
//  SpellCheck
//
//  Created by Alexey Ushakov on 2/27/14.
//  Copyright (c) 2014 jetbrains. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpellViewController;

@interface SpellAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SpellViewController *viewController;

@end