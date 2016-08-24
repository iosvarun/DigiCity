//
//  LoginViewController.m
//  DigiCity
//
//  Created by Naveen on 24/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
@implementation LoginViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

#pragma mark - UIButton Action
- (IBAction)btnGoToRegistrer:(id)sender {
    NSLog(@"go to register screen");
    SignUpViewController *objSignUpVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self.navigationController pushViewController:objSignUpVC animated:YES];
}

@end
