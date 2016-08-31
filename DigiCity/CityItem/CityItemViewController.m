//
//  CityItemViewController.m
//  DigiCity
//
//  Created by Varun Kumar on 24/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import "CityItemViewController.h"
#import "CityCollectionViewCell.h"
#import "CityItemListController.h"
#import "Constants.h"
#import "AppUtility.h"

@interface CityItemViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UICollectionView *cityCollectionView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CityItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *firstSection = [[NSMutableArray alloc] init];
    NSMutableArray *secondSection = [[NSMutableArray alloc] init];
    for (int i=0; i<50; i++) {
        [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
        [secondSection addObject:[NSString stringWithFormat:@"item %d", i]];
    }
    self.dataArray = [[NSArray alloc] initWithObjects:firstSection, nil];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [AppUtility showTabBar:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.dataArray count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    return [sectionArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CityCollectionViewCell";
    
    CityCollectionViewCell *cell = (CityCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
    NSString *cellData = [data objectAtIndex:indexPath.row];
    [cell.cityItemTitle setText:cellData];
    
    return cell;

    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    CityItemListController *objCityItemListController = [TabBarDetailsControllers_STORYBOARD instantiateViewControllerWithIdentifier:@"CityItemListController"];
    [self.navigationController pushViewController:objCityItemListController animated:YES];
    
//    NSLog(@"%@",[self.dataArray objectAtIndex:indexPath.row]);
  
   
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
        return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger width ;
    if (CGRectGetWidth(collectionView.frame) <330) {
        width = (CGRectGetWidth(collectionView.frame)-(1*2))/3;
    }
    else
        width = (CGRectGetWidth(collectionView.frame)-(1*3))/4;
    return CGSizeMake(width,84);
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
