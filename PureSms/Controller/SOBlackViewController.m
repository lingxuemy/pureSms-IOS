//
//  SOBlackTableViewController.m
//  PureSms
//
//  Created by YC X on 2018/4/13.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "SOBlackViewController.h"

#define KEYWORDARRAY @"KEYWORDARRAY"


@interface SOBlackViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *blackTableView;
@property (nonatomic, strong) NSMutableArray *keyWordMutArray;

@end

@implementation SOBlackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.keyWordMutArray = [[NSUserDefaults standardUserDefaults] objectForKey:KEYWORDARRAY];
    [self.blackTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.keyWordMutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = self.keyWordMutArray[indexPath.row];
    return cell;
}

- (NSMutableArray *)keyWordMutArray
{
    if (!_keyWordMutArray) {
        _keyWordMutArray = [NSMutableArray array];
    }
    return _keyWordMutArray;
}

@end
