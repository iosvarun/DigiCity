//
//  MainTabBarController.m
//  DigiCity
//
//  Created by Varun Kumar on 24/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import "MainTabBarController.h"


#import "Constants.h"

// All Five ViewControllers
#import "FeedViewController.h"
#import "EventViewController.h"
#import "CityItemViewController.h"
#import "NotificationViewController.h"
#import "AddPostViewController.h"

// TabNavigationControllers
#import "FeedNavigationController.h"
#import "EventNavigationController.h"
#import "CityNavigationController.h"
#import "NotificationNavigationController.h"
#import "AddPostNavigationController.h"

@interface MainTabBarController ()<UITabBarControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, readwrite) NSUInteger lastSelectedTab;
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastSelectedTab = kFeedTab;

    [self setDelegate:self];
    [self addTabs];
    
    [self setTabBarAppearance];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTabBarAppearance {
    self.tabBar.translucent = NO;
    
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    self.tabBar.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    self.tabBar.layer.shadowOffset = CGSizeMake(0.0f,0.0f);
    self.tabBar.layer.shadowOpacity = 1.0f;
    self.tabBar.layer.shadowRadius = 4.0f;
    
    // self.tabBar.selectedImageTintColor = [UIColor colorWithRed:50.0/255.0f green:50.0/255.0f blue:50.0/255.0f alpha:1.0];
    
    self.tabBar.tintColor =[UIColor colorWithRed:50.0/255.0f green:50.0/255.0f blue:50.0/255.0f alpha:1.0];
    
    //    [[UITabBar appearance] setBackgroundColor:[UIColor colorWithRed:(240.0/255.0) green:(240.0/255.0) blue:(240.0/255.0) alpha:1.0]];
    [self setTabBarIcons];
}

-(void)setTabBarIcons {
    NSArray *arrTabBarItems = self.tabBar.items;
    
    NSArray *arrTabIcons = [self tabIconsImages];
    NSArray *arrTabIconsSelected = [self tabIconsSelectedImages];
    
    for (int i=0; i<arrTabBarItems.count; i++) {
        UITabBarItem *tabItem = arrTabBarItems[i];
        tabItem.image = [[UIImage imageNamed: arrTabIcons[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabItem.imageInsets = i == kCityItemTab ? UIEdgeInsetsMake(0, 0, 0, 0) : UIEdgeInsetsMake(5, 0, -5, 0);
        tabItem.selectedImage = [[UIImage imageNamed:arrTabIconsSelected[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabItem.tag = i;
        
        if(tabItem.tag == 2){
            UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 34, self.tabBar.frame.size.width/5, 14.0)];
            lbl.center = CGPointMake(CGRectGetMidX(self.tabBar.frame), CGRectGetMidY(lbl.frame));
            lbl.textColor = [UIColor colorWithRed:(166.0/255.0) green:(166.0/255.0) blue:(166.0/255.0) alpha:1.0];
            lbl.font = [UIFont fontWithName:kCalibreRegular size:14.0f];
            lbl.textAlignment = NSTextAlignmentCenter;
            lbl.text = NSLocalizedString(@"Go Live", nil);
            lbl.adjustsFontSizeToFitWidth = YES;
            [self.tabBar addSubview:lbl];
        }
        
    }
}

-(NSArray *)tabIconsImages {
    NSArray *arrIconsImages = [[NSArray alloc] initWithObjects:@"HomeTabIcon",@"GiftShopTabIcon" , @"TalentSeasonTabIcon", @"NotficationTabIcon", @"ProfileTabIcon", nil];
    return arrIconsImages;
}

-(NSArray *)tabIconsSelectedImages {
    NSArray *arrIconsImages = [[NSArray alloc] initWithObjects:@"HomeTabIconSelected",@"GiftShopTabIconSelected", @"TalentSeasonTabIconSelected", @"NotficationTabIconSelected", @"ProfileTabIconSelected", nil];
    return arrIconsImages;
}

-(void)addTabs {
    
    NSArray *arrTabViewControllers = [[NSArray alloc] initWithObjects:[self createFeedTab], [self createEventTab], [self createCityTab], [self createNotificationTab], [self createAddPostTab], nil];
    self.viewControllers = arrTabViewControllers;
    /*FTL Screen deeplinking was not working on first time
     */
    //isMainTabBarLoaded = YES;
    
    //    self.selectedIndex = 1;
}


-(FeedNavigationController*)createFeedTab {
    FeedViewController *objHomeViewController = [TabBarControllers_STORYBOARD instantiateViewControllerWithIdentifier:@"FeedViewController"];
    
    FeedNavigationController *objHomeNavigationController = [[FeedNavigationController alloc] initWithRootViewController:objHomeViewController];
    objHomeNavigationController.delegate = self;
    return objHomeNavigationController;
}

-(EventNavigationController *)createEventTab {
    
    EventViewController *objSearchViewController = [TabBarControllers_STORYBOARD instantiateViewControllerWithIdentifier:@"EventViewController"];
    
    EventNavigationController *objSearchNavigationController = [[EventNavigationController alloc] initWithRootViewController:objSearchViewController];
    objSearchNavigationController.delegate = self;
    
    return objSearchNavigationController;
    
}
-(CityNavigationController *)createCityTab
{
    CityItemViewController *objSearchViewController = [TabBarControllers_STORYBOARD instantiateViewControllerWithIdentifier:@"CityItemViewController"];
    
    CityNavigationController *objSearchNavigationController = [[CityNavigationController alloc] initWithRootViewController:objSearchViewController];
    objSearchNavigationController.delegate = self;
    
    return objSearchNavigationController;
}

-(NotificationNavigationController *)createNotificationTab {
    
    NotificationViewController *objNotificationViewController = [TabBarControllers_STORYBOARD instantiateViewControllerWithIdentifier:@"NotificationViewController"];
    NotificationNavigationController *objNotificationNavigationController = [[NotificationNavigationController alloc] initWithRootViewController:objNotificationViewController];
    objNotificationNavigationController.delegate = self;
    return objNotificationNavigationController;
}

-(AddPostNavigationController *)createAddPostTab {
    
    AddPostViewController *objNotificationViewController = [TabBarControllers_STORYBOARD instantiateViewControllerWithIdentifier:@"AddPostViewController"];
    AddPostNavigationController *objNotificationNavigationController = [[AddPostNavigationController alloc] initWithRootViewController:objNotificationViewController];
    objNotificationNavigationController.delegate = self;
    return objNotificationNavigationController;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
