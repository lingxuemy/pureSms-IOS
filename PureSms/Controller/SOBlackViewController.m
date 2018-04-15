//
//  SOBlackViewController.m
//  PureSms
//
//  Created by YC X on 2018/4/13.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "SOBlackViewController.h"
#import "SOBlackTableViewCell.h"
#import "SOKeywordModelExt.h"

#define ExtentsionAppGroupName @"group.com.welightworld.puresms"
#define KEYWORDARRAY @"KEYWORDARRAY"
#define SOLocalize(key) NSLocalizedString(key, nil)

@interface SOBlackViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *blackTableView;
@property (nonatomic, strong) NSMutableArray *keyWordMutArray;

@end

@implementation SOBlackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"isFirst"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirst"];
        NSArray *array = @[SOLocalize(@"Reply"), SOLocalize(@"Unsubscribe"), SOLocalize(@"Regal"), SOLocalize(@"Macao"), SOLocalize(@"Casino"), SOLocalize(@"Download"), SOLocalize(@"Registered"), SOLocalize(@"Securities"), SOLocalize(@"Financial management"), SOLocalize(@"Income"), SOLocalize(@"Insurance"), SOLocalize(@"Participate"), SOLocalize(@"Click on"), SOLocalize(@"Fund"), SOLocalize(@"Share"), SOLocalize(@"Stamp"), SOLocalize(@"Loan"), SOLocalize(@"Voucher"), SOLocalize(@"www"), SOLocalize(@"http"), SOLocalize(@".cn"), SOLocalize(@".com")];
        for (NSString *keyStr in array) {
            SOKeywordModelExt *keyModel = [[SOKeywordModelExt alloc] init];
            keyModel.keywordStr = keyStr;
            keyModel.isOpen = YES;
            
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:keyModel];
            [self.keyWordMutArray addObject:data];
        }
        NSArray *keyArray = [NSArray arrayWithArray:self.keyWordMutArray];
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
        [userDefaults setObject:keyArray forKey:KEYWORDARRAY];
        [userDefaults synchronize];
    }
    
    self.blackTableView.separatorInset = UIEdgeInsetsMake(0, 9000, 0, 0);;
    [self.blackTableView registerNib:[UINib nibWithNibName:@"SOBlackTableViewCell" bundle:nil] forCellReuseIdentifier:@"SOBlackTableViewCell"];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
    self.keyWordMutArray = [userDefaults objectForKey:KEYWORDARRAY];
    [self.blackTableView reloadData];
}

- (IBAction)rightButEvent:(UIBarButtonItem *)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入关键词" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入关键词";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *tempField = [alertController.textFields firstObject];
        NSLog(@"%@",tempField.text);
        NSLog(@"ok");
        if (tempField.text.length) {
            SOKeywordModelExt *keyModel = [[SOKeywordModelExt alloc] init];
            keyModel.isOpen = YES;
            keyModel.keywordStr = tempField.text;
            
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:keyModel];
            NSMutableArray *mutArray = [NSMutableArray arrayWithArray:self.keyWordMutArray];
            [mutArray insertObject:data atIndex:0];
            self.keyWordMutArray = mutArray;
            [self.blackTableView reloadData];

            NSArray *keyArray = [NSArray arrayWithArray:self.keyWordMutArray];
            NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
            [userDefaults setObject:keyArray forKey:KEYWORDARRAY];
            [userDefaults synchronize];
        };
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:YES completion:^{
        NSLog(@"presented");
    }];
}

- (void)cellSwitch:(UISwitch *) sender
{
    NSLog(@"sender.tag == %ld", sender.tag);
    SOKeywordModelExt *keyModel = [NSKeyedUnarchiver unarchiveObjectWithData:self.keyWordMutArray[sender.tag]];
    keyModel.isOpen = sender.on;
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:keyModel];
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:self.keyWordMutArray];
    [mutArray replaceObjectAtIndex:sender.tag withObject:data];
    self.keyWordMutArray = mutArray;
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
    [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY];
    [userDefaults synchronize];
}

- (void)cellDelete:(UIButton *) sender
{
    NSLog(@"sender.tag == %ld", sender.tag);
    [self tableView:self.blackTableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0]];
    [self.blackTableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.keyWordMutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SOBlackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SOBlackTableViewCell" forIndexPath:indexPath];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
//    }
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    SOKeywordModelExt *keyModel = [NSKeyedUnarchiver unarchiveObjectWithData:self.keyWordMutArray[indexPath.row]];
    cell.cellLabel.text = keyModel.keywordStr;
    cell.cellSwitch.on = keyModel.isOpen;
    
    cell.cellSwitch.tag = indexPath.row;
    [cell.cellSwitch addTarget:self action:@selector(cellSwitch:) forControlEvents:UIControlEventValueChanged];
    cell.cellDelete.tag = indexPath.row;
    [cell.cellDelete addTarget:self action:@selector(cellDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indepat == %ld", (long)indexPath.row);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *mutArray = [NSMutableArray arrayWithArray:self.keyWordMutArray];
        [mutArray removeObjectAtIndex:indexPath.row];
        self.keyWordMutArray = mutArray;
        
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
        [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY];
        [userDefaults synchronize];
        
        [self.blackTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
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
