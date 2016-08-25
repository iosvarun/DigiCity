//
//  AppUtility.m
//  DigiCity
//
//  Created by Varun Kumar on 25/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import "AppUtility.h"
#import <UIKit/UIKit.h>
#import "Constants.h"
#import "AppDelegate.h"

@implementation AppUtility

+(void)hideTabBar:(BOOL)animated {
    
    if (animated) {
        [UIView animateWithDuration:kTabBarHideShowAnimationDelay animations:^{
            CGRect biggerFrame = [AppDelegateCons() mainTabBarController].view.frame;
            float tabBarControllerHeight = [UIScreen mainScreen].bounds.size.height;
            tabBarControllerHeight += 49;
            biggerFrame.size.height = tabBarControllerHeight;
            
            [AppDelegateCons() mainTabBarController].view.frame = biggerFrame ;
        } completion:^(BOOL finished) {
            
        }];
    }
    else {
        CGRect biggerFrame = [AppDelegateCons() mainTabBarController].view.frame;
        float tabBarControllerHeight = [UIScreen mainScreen].bounds.size.height;
        tabBarControllerHeight += 49;
        biggerFrame.size.height = tabBarControllerHeight;
        [AppDelegateCons() mainTabBarController].view.frame = biggerFrame ;
    }
}

+(void)showTabBar:(BOOL)animated {
    
    if (animated) {
        [UIView animateWithDuration:kTabBarHideShowAnimationDelay animations:^{
            CGRect biggerFrame = [AppDelegateCons() mainTabBarController].view.frame;
            biggerFrame.size.height = [UIScreen mainScreen].bounds.size.height - CGRectGetMinY(biggerFrame);          [AppDelegateCons() mainTabBarController].view.frame = biggerFrame;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    else {
        CGRect biggerFrame = [AppDelegateCons() mainTabBarController].view.frame;
        biggerFrame.size.height = [UIScreen mainScreen].bounds.size.height;
        [AppDelegateCons() mainTabBarController].view.frame = biggerFrame;
    }
}

@end
