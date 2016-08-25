//
//  LoginViewController.m
//  DigiCity
//
//  Created by Naveen on 24/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "Constants.h"
#import "AppDelegate.h"

@implementation LoginViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

#pragma mark - UIButton Action
- (IBAction)btnActionToRegister:(id)sender {
    NSLog(@"go to register screen");
    SignUpViewController *objSignUpVC = [Main_STORYBOARD instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self.navigationController pushViewController:objSignUpVC animated:YES];

}
- (IBAction)btnActionLogin:(id)sender {
    [AppDelegateCons() setMainTabbarControllerAsWindowRoot];
}



@end
