//
//  TableViewController.m
//  NHBalancedFlowLayoutDemo
//
//  Created by 张祥 on 15/12/23.
//  Copyright © 2015年 Niels de Hoog. All rights reserved.
//

#import "TableViewController.h"
#import "NHCollagePhoto.h"
#import "NHCollagePreView.h"
#import "TableViewCell.h"

@interface TableViewController () {
    NSMutableArray *_dataArr;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _dataArr = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 24; i ++) {
        NSMutableArray *photos = [[NSMutableArray alloc] init];
        for (int j = i; j <= 24; j++) {
            NHCollagePhoto *photo = [[NHCollagePhoto alloc] init];
            photo.image = [UIImage imageNamed:[NSString stringWithFormat:@"photo-%02d.jpg", i]];
            photo.url = @"";
            photo.width = 100;
            photo.height = 50;
            [photos addObject:photo];
        }
        [_dataArr addObject:photos];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSLog(@"====%ld=====%lu",(long)indexPath.row,(unsigned long)_dataArr.count);
    NSArray *photos = _dataArr[indexPath.row];
    cell.collagePreView.photos = _dataArr[indexPath.row];
    CGFloat height = cell.collagePreView.contentSize.height;
    cell.heightConstraint.constant = height;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
