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

@interface LoginViewController(){
    
    __weak IBOutlet UITextField *textFiledEmail;
    __weak IBOutlet UITextField *textFiledPassword;
}

@end

@implementation LoginViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[self.navigationController setNavigationBarHidden:YES animated:animated];}
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //[self.navigationController setNavigationBarHidden:NO animated:animated];
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

- (IBAction)btnActionSkip:(id)sender {
    [AppDelegateCons() setMainTabbarControllerAsWindowRoot];
}

- (IBAction)btnActionForgotPassword:(id)sender {
    NSString *message;
    NSString *title;
    title = @"Enter email";
    if ([textFiledEmail.text isEqualToString:@""])
        message = @"Enter your email and tap on 'Forgot Password' to receive a link to reset";
    else
        message = @"Please enter a valid email address";
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
