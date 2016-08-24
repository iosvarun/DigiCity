//
//  AppDelegate.h
//  DigiCity
//
//  Created by Varun Kumar on 24/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
#import "Constants.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MainTabBarController *mainTabBarController;

-(void)setMainTabbarControllerAsWindowRoot;

@end

