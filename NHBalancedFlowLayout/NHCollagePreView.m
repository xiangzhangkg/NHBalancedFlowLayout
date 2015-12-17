//
//  NHCollagePreView.m
//  NHBalancedFlowLayoutDemo
//
//  Created by Zhang, Xiang on 15/12/17.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import "NHCollagePreView.h"
#import "NHBalancedFlowLayout.h"
#import "NHCollagePhoto.h"
#import "NHCollageCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString *NHCollageCellIdentifier = @"NHCollageCell";

@interface NHCollagePreView ()<NHBalancedFlowLayoutDelegate> {
    IBOutlet __weak UICollectionView *_collectionView;
    IBOutlet __weak NHBalancedFlowLayout *_collectionViewLayout;
    NSArray<NHCollagePhoto *> *_photoArr;
}

@end

@implementation NHCollagePreView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    UIView *containerView = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
    CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    containerView.frame = newFrame;
    [self addSubview:containerView];
    
    // Initial value
    _maxNumber = NSIntegerMax;
    _maxHeightWhenSingle = CGFLOAT_MAX;
    _scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // Default value
    _maxNumber = 5;
    _maxHeightWhenSingle = 200.f;
    
    // Set collectionViewLayout property value
    _collectionViewLayout.preferredRowSize = 50.f;
    _collectionViewLayout.headerReferenceSize = CGSizeZero;
    _collectionViewLayout.footerReferenceSize = CGSizeZero;
    _collectionViewLayout.sectionInset = UIEdgeInsetsZero;
    _collectionViewLayout.minimumLineSpacing = 2.f;
    _collectionViewLayout.minimumInteritemSpacing = 2.f;
    _collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NHCollageCell class]) bundle:nil] forCellWithReuseIdentifier:NHCollageCellIdentifier];
}

#pragma mark - Setter

- (void)setPhotos:(NSArray<NHCollagePhoto *> *)photos {
    NSAssert((_delegate && [_delegate respondsToSelector:@selector(finishCalculateContentSize:)]), @"You should conform to NHCollagePreViewDelegate required protocol");
    _photoArr = photos;
    // empty array
    if (_photoArr.count == 0) {
        return;
    }
    // set numberOfRows
    if (_photoArr.count <= 2) {
        _collectionViewLayout.numberOfRows = 1;
        // when set photo after set maxHeightWhenSingle
        if (_photoArr.count == 1 && _collectionViewLayout.maxHeightWhenSingle != _maxHeightWhenSingle) {
            _collectionViewLayout.maxHeightWhenSingle = _maxHeightWhenSingle;
        }
    } else {
        _collectionViewLayout.numberOfRows = 2;
    }
}

- (void)setMaxNumber:(NSInteger)maxNumber {
    _maxNumber = maxNumber;
    
    // TODO: need reload?
    [_collectionViewLayout invalidateLayout];
}

- (void)setMaxHeightWhenSingle:(CGFloat)maxHeightWhenSingle {
    _maxHeightWhenSingle = maxHeightWhenSingle;
    if (_photoArr.count == 1) {
        _collectionViewLayout.maxHeightWhenSingle = maxHeightWhenSingle;
    }
}

- (void)setPreferredRowSize:(CGFloat)preferredRowSize {
    _preferredRowSize = preferredRowSize;
    _collectionViewLayout.preferredRowSize = preferredRowSize;
}

- (void)setHeaderReferenceSize:(CGSize)headerReferenceSize {
    _headerReferenceSize = headerReferenceSize;
    _collectionViewLayout.headerReferenceSize = headerReferenceSize;
}

- (void)setFooterReferenceSize:(CGSize)footerReferenceSize {
    _footerReferenceSize = footerReferenceSize;
    _collectionViewLayout.footerReferenceSize = footerReferenceSize;
}

- (void)setSectionInset:(UIEdgeInsets)sectionInset {
    _sectionInset = sectionInset;
    _collectionViewLayout.sectionInset = sectionInset;
}

- (void)setMinimumLineSpacing:(CGFloat)minimumLineSpacing {
    _minimumLineSpacing = minimumLineSpacing;
    _collectionViewLayout.minimumLineSpacing = minimumLineSpacing;
}

- (void)setMinimumInteritemSpacing:(CGFloat)minimumInteritemSpacing {
    _minimumInteritemSpacing = minimumInteritemSpacing;
    _collectionViewLayout.minimumInteritemSpacing = minimumInteritemSpacing;
}

- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection {
    _scrollDirection = scrollDirection;
    _collectionViewLayout.scrollDirection = scrollDirection;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _photoArr.count > _maxNumber ? _maxNumber : _photoArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NHCollageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NHCollageCellIdentifier forIndexPath:indexPath];
    NHCollagePhoto *photo = _photoArr[indexPath.item];
    if (photo.image) {
        cell.imageView.image = photo.image;
    } else {
        [cell.activityIndicatorView startAnimating];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:photo.url] placeholderImage:photo.placeholderImage options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [cell.activityIndicatorView stopAnimating];
        }];
    }
    
    if (_photoArr.count > _maxNumber && indexPath.item == _maxNumber - 1) {
        cell.moreLabel.hidden = NO;
        cell.moreLabel.text = [NSString stringWithFormat:@"+%lu",_photoArr.count - _maxNumber];
    } else {
        cell.moreLabel.hidden = YES;
        cell.moreLabel.text = nil;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (_delegate && [_delegate respondsToSelector:@selector(collagePreView:didSelectItemAtIndexPath:)]) {
        [_delegate collagePreView:self didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - NHBalancedFlowLayoutDelegate

- (void)finishCalculateContentSize:(CGSize)aSize {
    if (_delegate && [_delegate respondsToSelector:@selector(finishCalculateContentSize:)]) {
        [_delegate finishCalculateContentSize:aSize];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(NHBalancedFlowLayout *)collectionViewLayout preferredSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NHCollagePhoto *photo = _photoArr[indexPath.item];
    if (photo.image) {
        return photo.image.size;
    } else {
        return CGSizeMake(photo.width, photo.height);
    }    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
