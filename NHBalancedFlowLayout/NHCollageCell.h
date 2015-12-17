//
//  NHCollageCell.h
//  NHBalancedFlowLayoutDemo
//
//  Created by Zhang, Xiang on 15/12/17.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHCollageCell : UICollectionViewCell

@property(nonatomic, weak) IBOutlet UIImageView *imageView;
@property(nonatomic, weak) IBOutlet UILabel *moreLabel;
@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end
