//
//  CityCollectionViewCell.h
//  DigiCity
//
//  Created by Varun Kumar on 25/08/16.
//  Copyright © 2016 Varun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak) IBOutlet UIImageView *cityItemImage;
@property (nonatomic, weak) IBOutlet UILabel *cityItemTitle;

@end
