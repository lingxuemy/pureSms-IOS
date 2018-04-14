//
//  SOBlackViewController.m
//  PureSms
//
//  Created by YC X on 2018/4/13.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "SOBlackViewController.h"

#define ExtentsionAppGroupName @"group.com.welightworld.puresms"
#define KEYWORDARRAY @"KEYWORDARRAY"

@interface SOBlackViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *blackTableView;
@property (nonatomic, strong) NSMutableArray *keyWordMutArray;

@end

@implementation SOBlackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blackTableView.separatorInset = UIEdgeInsetsMake(0, 9000, 0, 0);;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
    self.keyWordMutArray = [userDefaults objectForKey:KEYWORDARRAY];
    [self.blackTableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.keyWordMutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    cell.textLabel.text = self.keyWordMutArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *mutArray = [NSMutableArray arrayWithArray:self.keyWordMutArray];
        [mutArray removeObjectAtIndex:indexPath.row];
        self.keyWordMutArray = mutArray;
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY];
        [userDefaults synchronize];
        
        [self.blackTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NSLocalizedString(@"Delete", nil);
}

- (NSMutableArray *)keyWordMutArray
{
    if (!_keyWordMutArray) {
        _keyWordMutArray = [NSMutableArray array];
    }
    return _keyWordMutArray;
}

@end
