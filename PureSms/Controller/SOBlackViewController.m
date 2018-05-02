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
#import "SOHelpViewController.h"
#import <StoreKit/StoreKit.h>
#import "UITableView+Animations.h"

#define ExtentsionAppGroupName @"group.com.welightworld.puresms"
#define KEYWORDARRAY @"KEYWORDARRAY"
#define KEYWORDARRAY_WHITE @"KEYWORDARRAY_WHITE"
#define SOLocalize(key) NSLocalizedString(key, nil)

@interface SOBlackViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftButItem;
@property (weak, nonatomic) IBOutlet UITableView *blackTableView;
@property (weak, nonatomic) IBOutlet UIButton *openHelpBut;
@property (nonatomic, strong) NSMutableArray *keyWordMutArray;
@property (nonatomic, strong) NSMutableArray *whiteKeyWordMutArray;
@property (nonatomic, strong) NSMutableArray *blackKeyWordMutArray;
@property (nonatomic, assign) BOOL isBlack;
@property (nonatomic, strong) UIButton *leftBut;

@end

@implementation SOBlackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.openHelpBut.layer.borderWidth = 1;
//    self.openHelpBut.layer.borderColor = [UIColor blackColor].CGColor;
    self.openHelpBut.layer.cornerRadius = 20;
    self.openHelpBut.layer.masksToBounds = YES;
    
    if (![[NSUserDefaults standardUserDefaults] integerForKey:@"isFirst"]) {
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"isFirst"];
        [self openHelpButEvent:self.openHelpBut];
        // 默认黑名单
        NSArray *blackArray = @[SOLocalize(@"Reply"), SOLocalize(@"Unsubscribe"), SOLocalize(@"Regal"), SOLocalize(@"Macao"), SOLocalize(@"Casino"), SOLocalize(@"Download"), SOLocalize(@"Registered"), SOLocalize(@"Securities"), SOLocalize(@"Financial management"), SOLocalize(@"Income"), SOLocalize(@"Insurance"), SOLocalize(@"Participate"), SOLocalize(@"Click on"), SOLocalize(@"Fund"), SOLocalize(@"Share"), SOLocalize(@"Stamp"), SOLocalize(@"Loan"), SOLocalize(@"Voucher"), SOLocalize(@"www"), SOLocalize(@"http"), SOLocalize(@".cn"), SOLocalize(@".com")];
        for (NSString *keyStr in blackArray) {
            SOKeywordModelExt *keyModel = [[SOKeywordModelExt alloc] init];
            keyModel.keywordStr = keyStr;
            keyModel.isOpen = YES;
            keyModel.isBlack = YES;
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:keyModel];
            [self.blackKeyWordMutArray addObject:data];
        }
        NSArray *keyArray = [NSArray arrayWithArray:self.blackKeyWordMutArray];
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
        [userDefaults setObject:keyArray forKey:KEYWORDARRAY];
        [userDefaults synchronize];
        [[[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName] setInteger:0 forKey:@"SKSTORE"];
        
        // 默认白名单
        NSArray *whiteArray = @[SOLocalize(@"Verification code"), SOLocalize(@"Verification"), SOLocalize(@"Code"), SOLocalize(@"balance"), SOLocalize(@"bank")];
        for (NSString *keyStr in whiteArray) {
            SOKeywordModelExt *keyModel = [[SOKeywordModelExt alloc] init];
            keyModel.keywordStr = keyStr;
            keyModel.isBlack = NO;
            if ([keyStr isEqualToString:SOLocalize(@"bank")]) {
                keyModel.isOpen = NO;
            }
            else {
                keyModel.isOpen = YES;
            }
            
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:keyModel];
            [self.whiteKeyWordMutArray addObject:data];
        }
        NSArray *whiteKeyArray = [NSArray arrayWithArray:self.whiteKeyWordMutArray];
        NSUserDefaults *whiteUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
        [whiteUserDefaults setObject:whiteKeyArray forKey:KEYWORDARRAY_WHITE];
        [whiteUserDefaults synchronize];
    }
    else {
        NSInteger skstoreInt = [[[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName] integerForKey:@"SKSTORE"];
        NSInteger integer = [[NSUserDefaults standardUserDefaults] integerForKey:@"isFirst"];
        [[NSUserDefaults standardUserDefaults] setInteger:integer+1 forKey:@"isFirst"];
        // 如果是第二十五次就提示用户评分
        if (skstoreInt == 25) {
            if([SKStoreReviewController respondsToSelector:@selector(requestReview)]) {// iOS 10.3 以上支持
                [SKStoreReviewController requestReview];
            } else { // iOS 10.3 之前的使用这个
                NSString *APPID = @"1372766943";
                NSString  * nsStringToOpen = [NSString  stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@?action=write-review",APPID];//替换为对应的APPID
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen]];
            }
        }
    }
    
    self.blackTableView.separatorInset = UIEdgeInsetsMake(0, 9000, 0, 0);;
    [self.blackTableView registerNib:[UINib nibWithNibName:@"SOBlackTableViewCell" bundle:nil] forCellReuseIdentifier:@"SOBlackTableViewCell"];
    
    _leftBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [_leftBut addTarget:self action:@selector(leftButEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_leftBut setTitle:@"  白名单  " forState:UIControlStateNormal];
    _leftBut.titleLabel.font = [UIFont systemFontOfSize:14];
    [_leftBut setTitleColor:[UIColor colorWithRed:21/255.0 green:126/255.0 blue:251/255.0 alpha:1] forState:UIControlStateNormal];
    _leftBut.layer.cornerRadius = 15;
    _leftBut.layer.masksToBounds = YES;
    _leftBut.layer.borderWidth = 1;
    _leftBut.layer.borderColor = [UIColor colorWithRed:21/255.0 green:126/255.0 blue:251/255.0 alpha:1].CGColor;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBut];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self getKeyWord];
    self.keyWordMutArray = self.blackKeyWordMutArray;
    _isBlack = YES;
    [self.blackTableView reloadData];
}

- (void)getKeyWord
{
    NSUserDefaults *whiteUserDef = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
    self.whiteKeyWordMutArray = [whiteUserDef objectForKey:KEYWORDARRAY_WHITE];
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
    self.blackKeyWordMutArray = [userDefaults objectForKey:KEYWORDARRAY];
}

- (IBAction)openHelpButEvent:(UIButton *)sender {
    SOHelpViewController *helpVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SOHelpViewController"];
    [self.navigationController pushViewController:helpVC animated:YES];
}

- (IBAction)leftButEvent:(UIBarButtonItem *)sender {
    [self getKeyWord];
    if (_isBlack) {
        _isBlack = NO;
        self.title = @"短信过滤 白名单";
        sender.title = @"黑名单";
        [_leftBut setTitle:@"黑名单" forState:UIControlStateNormal];
        self.keyWordMutArray = self.whiteKeyWordMutArray;
    }
    else {
        _isBlack = YES;
        self.title = @"短信过滤 黑名单";
        sender.title = @"白名单";
        [_leftBut setTitle:@"白名单" forState:UIControlStateNormal];
        self.keyWordMutArray = self.blackKeyWordMutArray;
    }
    [self.blackTableView reloadData];
    [self.blackTableView performAnimation:AnimationRightToLeft finishBlock:nil];
}

- (IBAction)rightButEvent:(UIBarButtonItem *)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SOLocalize(@"Please enter a keyword") message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = SOLocalize(@"Please enter a keyword");
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:SOLocalize(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *tempField = [alertController.textFields firstObject];
        NSLog(@"%@",tempField.text);
        NSLog(@"ok");
        if (tempField.text.length) {
            SOKeywordModelExt *keyModel = [[SOKeywordModelExt alloc] init];
            keyModel.isOpen = YES;
            keyModel.keywordStr = tempField.text;
            if (_isBlack) {
                keyModel.isBlack = YES;
            }
            else {
                keyModel.isBlack = NO;
            }
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:keyModel];
            NSMutableArray *mutArray = [NSMutableArray arrayWithArray:self.keyWordMutArray];
            [mutArray insertObject:data atIndex:0];
            self.keyWordMutArray = mutArray;
            [self.blackTableView reloadData];

            NSArray *keyArray = [NSArray arrayWithArray:self.keyWordMutArray];
            NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
            if (_isBlack) {
                [userDefaults setObject:keyArray forKey:KEYWORDARRAY];
            }
            else {
                [userDefaults setObject:keyArray forKey:KEYWORDARRAY_WHITE];
            }
            [userDefaults synchronize];
        };
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:SOLocalize(@"Cancel") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];

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
    if (_isBlack) {
        [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY];
    }
    else {
        [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY_WHITE];
    }
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
        if (_isBlack) {
            [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY];
        }
        else {
            [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY_WHITE];
        }
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

- (NSMutableArray *)whiteKeyWordMutArray
{
    if (!_whiteKeyWordMutArray) {
        _whiteKeyWordMutArray = [NSMutableArray array];
    }
    return _whiteKeyWordMutArray;
}

- (NSMutableArray *)blackKeyWordMutArray
{
    if (!_blackKeyWordMutArray) {
        _blackKeyWordMutArray = [NSMutableArray array];
    }
    return _blackKeyWordMutArray;
}

@end
