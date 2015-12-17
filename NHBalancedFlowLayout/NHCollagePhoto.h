//
//  NHCollagePhoto.h
//  NHBalancedFlowLayoutDemo
//
//  Created by Zhang, Xiang on 15/12/18.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHCollagePhoto : NSObject

@property(nonatomic, strong) UIImage *placeholderImage;
@property(nonatomic, strong) UIImage *image;
//if image property is nil, the following properties can not be nil
@property(nonatomic, copy) NSString *url;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;

@end
