//
//  Constants.h
//  DigiCity
//
//  Created by Varun Kumar on 24/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define AppDelegateCons() (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define kTabBarHideShowAnimationDelay 0.1

// Define StoryBoard
#define TabBarControllers_STORYBOARD                       ([UIStoryboard storyboardWithName:@"Main_StoryBoard" bundle:nil])
#define Main_STORYBOARD ([UIStoryboard storyboardWithName:@"Main" bundle:nil])

//Font Styles
#define kCalibreBlack                       @"Calibre-Black"
#define kCalibreBlackItalic                 @"Calibre-BlackItalic"
#define kCalibreBold                        @"Calibre-Bold"
#define kCalibreBoldItalic                  @"Calibre-BoldItalic"
#define kCalibreLight                       @"Calibre-Light"
#define kCalibreLightItalic                 @"Calibre-LightItalic"
#define kCalibreMedium                      @"Calibre-Medium"
#define kCalibreMediumItalic                @"Calibre-MediumItalic"
#define kCalibreRegular                     @"Calibre-Regular"
#define kCalibreRegularItalic               @"Calibre-RegularItalic"
#define kCalibreSemibold                    @"Calibre-Semibold"
#define kCalibreSemiboldItalic              @"Calibre-SemiboldItalic"
#define kCalibreThin                        @"Calibre-Thin"
#define kCalibreThinItalic


typedef enum {
    kFeedTab = 0,
    kAddPostTab = 1,
    kCityItemTab = 2,
    kNotificationTab = 3,
    kEventTab = 4,
}Tabs;

#endif /* Constants_h */
