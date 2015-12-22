//
//  TableViewCell.h
//  NHBalancedFlowLayoutDemo
//
//  Created by 张祥 on 15/12/23.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NHCollagePreView;

@interface TableViewCell : UITableViewCell 

@property(nonatomic, strong) IBOutlet NHCollagePreView *collagePreView;
@property(nonatomic, weak) IBOutlet NSLayoutConstraint *heightConstraint;

@end
