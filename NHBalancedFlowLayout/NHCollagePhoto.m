//
//  NHCollagePhoto.m
//  NHBalancedFlowLayoutDemo
//
//  Created by Zhang, Xiang on 15/12/18.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import "NHCollagePhoto.h"

@implementation NHCollagePhoto

- (UIImage *)image {
    if (!_image) {
        BOOL exist = _url && _width && _height;
        NSAssert(exist, @"Photo info can not be nil");
    }
    
    return _image;
}

@end
