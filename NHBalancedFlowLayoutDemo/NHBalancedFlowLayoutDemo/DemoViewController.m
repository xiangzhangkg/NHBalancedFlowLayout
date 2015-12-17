//
//  DemoViewController.m
//  NHBalancedFlowLayoutDemo
//
//  Created by Zhang, Xiang on 15/12/17.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import "DemoViewController.h"
#import "NHCollagePhoto.h"
#import "NHCollagePreViewDelegate.h"
#import "NHCollagePreView.h"

@interface DemoViewController ()<NHCollagePreViewDelegate> {
    IBOutlet __weak NHCollagePreView *_collagePreView;
    IBOutlet __weak NSLayoutConstraint *_heightConstraint;
}

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _collagePreView.delegate = self;
    
    //test
    
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 24; i++) {
        NHCollagePhoto *photo = [[NHCollagePhoto alloc] init];
        photo.image = [UIImage imageNamed:[NSString stringWithFormat:@"photo-%02d.jpg", i]];
        photo.url = @"";
        photo.width = 100;
        photo.height = 50;
        [photos addObject:photo];
    }
    
    _collagePreView.photos = photos;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NHCollagePreViewDelegate

- (void)finishCalculateContentSize:(CGSize)aSize {
    _heightConstraint.constant = aSize.height;
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
