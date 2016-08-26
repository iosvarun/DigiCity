//
//  CityItemDetailsController.m
//  DigiCity
//
//  Created by Varun Kumar on 26/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import "CityItemDetailsController.h"

@interface CityItemDetailsController ()

@end

@implementation CityItemDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnActionBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
