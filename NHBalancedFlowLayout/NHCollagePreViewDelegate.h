//
//  NHCollagePreViewDelegate.h
//  NHBalancedFlowLayoutDemo
//
//  Created by Zhang, Xiang on 15/12/18.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NHCollagePreView;

@protocol NHCollagePreViewDelegate <NSObject>

@optional
- (void)finishCalculateContentSize:(CGSize)aSize;

- (void)collagePreView:(NHCollagePreView *)collagePreView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
