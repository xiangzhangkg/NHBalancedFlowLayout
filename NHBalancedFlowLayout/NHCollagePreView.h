//
//  NHCollagePreView.h
//  NHBalancedFlowLayoutDemo
//
//  Created by Zhang, Xiang on 15/12/17.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHCollagePreViewDelegate.h"

@class NHCollagePhoto;

@interface NHCollagePreView : UIView

@property(nonatomic, weak) id<NHCollagePreViewDelegate> delegate;

// The photos datasource with NHCollagePhoto object
@property(nonatomic, copy) NSArray<NHCollagePhoto *> *photos;

// The contentSize of collage view
@property(nonatomic, assign) CGSize contentSize;

// The max number of collage will show, more will show "+N"
@property(nonatomic, assign) NSInteger maxNumber;

// The max height when there is a single photo
@property(nonatomic, assign) CGFloat maxHeightWhenSingle;

// The preferred size for each row measured in the scroll direction
@property (nonatomic) CGFloat preferredRowSize;

// The size of each section's header. This maybe dynamically adjusted
// per section via the protocol method referenceSizeForHeaderInSection.
@property (nonatomic) CGSize headerReferenceSize;

// The size of each section's header. This maybe dynamically adjusted
// per section via the protocol method referenceSizeForFooterInSection.
@property (nonatomic) CGSize footerReferenceSize;

// The margins used to lay out content in a section.
@property (nonatomic) UIEdgeInsets sectionInset;

// The minimum spacing to use between lines of items in the grid.
@property (nonatomic) CGFloat minimumLineSpacing;

// The minimum spacing to use between items in the same row.
@property (nonatomic) CGFloat minimumInteritemSpacing;

// The scroll direction of the grid.
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

@end
