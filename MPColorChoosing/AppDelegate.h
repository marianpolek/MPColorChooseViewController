//
//  AppDelegate.h
//  MPColorChoosing
//
//  Created by Marian Polek on 7/16/13.
//  Copyright (c) 2013 Marian Polek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPColorChooseViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, MPColorChooseDelegate>{
    UINavigationController *nc;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
