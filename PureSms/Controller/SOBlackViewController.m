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
#import <StoreKit/StoreKit.h>
#import "UITableView+Animations.h"
#import "MLMenuView.h"

#define ExtentsionAppGroupName @"group.smsgroupPro"
#define ExtentsionAppGroupNamePro @"group.smsgroup"
#define KEYWORDARRAY @"KEYWORDARRAY"
#define KEYWORDARRAY_WHITE @"KEYWORDARRAY_WHITE"
#define KEYWORDARRAY_PHONE @"KEYWORDARRAY_PHONE"
#define KEYWORDARRAY_WHITE_PHONE @"KEYWORDARRAY_WHITE_PHONE"
#define BUNDLEID [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define PURESMS @"com.puresmsPro"
#define PURESMSPRO @"com.puresms"
#define APPID @"1564769961"
#define APPIDPRO @"1564769962"

#define  MLClolor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define  k_ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define  k_ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  k_StatusBarHeight    [UIApplication sharedApplication].statusBarFrame.size.height
#define  k_NavigationBarHeight  44.f
#define  k_StatusBarAndNavigationBarHeight   (k_StatusBarHeight + k_NavigationBarHeight)
#define FontSizeDefault   [UIFont systemFontOfSize:14]
#define TitleColorDefault [UIColor whiteColor]
#define SeparatorColorDefault [UIColor whiteColor]
#define SeparatorOffsetDefault 0

typedef enum : NSUInteger {
    ADDKEYWORDBLACK = 0,
    ADDKEYWORDWHITE,
    ADDKEYWORDBLACKPHONE,
    ADDKEYWORDWHITEPHONE
} AddKeyWord;

@interface SOBlackViewController ()<UITableViewDelegate, UITableViewDataSource, SKStoreProductViewControllerDelegate>
{
    NSString *suiteNameStr;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftButItem;
@property (weak, nonatomic) IBOutlet UITableView *blackTableView;
@property (nonatomic, strong) NSMutableArray *keyWordMutArray;
@property (nonatomic, strong) NSMutableArray *whiteKeyWordMutArray;
@property (nonatomic, strong) NSMutableArray *blackKeyWordMutArray;
@property (nonatomic, strong) NSMutableArray *whitePhoneMutArray;
@property (nonatomic, strong) NSMutableArray *blackPhoneMutArray;
@property (nonatomic, assign) BOOL isBlack;
@property (nonatomic, strong) UIButton *leftBut;
@property (nonatomic, strong) NSString *userdefKey;
@property (nonatomic, assign) NSInteger numberInt;
@property (nonatomic, assign) AddKeyWord addKeyWord;

@end

@implementation SOBlackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = SOLocalize(@"SMS Blackcontent");
    
    suiteNameStr = ExtentsionAppGroupName;
    if ([BUNDLEID isEqualToString:PURESMSPRO]) {
        suiteNameStr = ExtentsionAppGroupNamePro;
    }
    
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"isFirst"] < 2) {
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"isFirst"];
        
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
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
        [userDefaults setObject:keyArray forKey:KEYWORDARRAY];
        [userDefaults synchronize];
        
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
        NSUserDefaults *whiteUserDefaults = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
        [whiteUserDefaults setObject:whiteKeyArray forKey:KEYWORDARRAY_WHITE];
        [whiteUserDefaults synchronize];
        
    }
    
    self.blackTableView.separatorInset = UIEdgeInsetsMake(0, 9000, 0, 0);
    [self.blackTableView registerNib:[UINib nibWithNibName:@"SOBlackTableViewCell" bundle:nil] forCellReuseIdentifier:@"SOBlackTableViewCell"];
    
    [self getKeyWord];
    self.keyWordMutArray = self.blackKeyWordMutArray;
}

// 获取关键词
- (void)getKeyWord
{
    NSUserDefaults *whiteUserDef = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
    self.whiteKeyWordMutArray = [whiteUserDef objectForKey:KEYWORDARRAY_WHITE];
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
    self.blackKeyWordMutArray = [userDefaults objectForKey:KEYWORDARRAY];
    NSUserDefaults *whiteUserDefPho = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
    self.whitePhoneMutArray = [whiteUserDefPho objectForKey:KEYWORDARRAY_WHITE_PHONE];
    NSUserDefaults *userDefaultsPho = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
    self.blackPhoneMutArray = [userDefaultsPho objectForKey:KEYWORDARRAY_PHONE];
    
}

#pragma mark - 显示提示UI

/**
 加载MLMenu菜单
 */
- (void)loadMLMenuWithTitles:(NSArray *) titles
{
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 150 - 10, 0, 150, 44 * 4) WithTitles:titles WithImageNames:nil WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:130 triangleColor:[UIColor whiteColor]];
    [menuView setCoverViewBackgroundColor:MLClolor(51, 51, 51, 0.1)];
    menuView.separatorColor = MLClolor(51, 51, 51, 0.1);
    [menuView setMenuViewBackgroundColor:[UIColor whiteColor]];
    menuView.titleColor =  MLClolor(51, 51, 51, 1);
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
        [self getKeyWord];
        switch (index) {
            case 0:
                // 添加关键词
            {
                self.userdefKey = @"isRightBtn";
                if (![[NSUserDefaults standardUserDefaults] boolForKey:@"VIP"] && ![BUNDLEID isEqualToString:PURESMSPRO]) {
//                    _numberInt = [[NSUserDefaults standardUserDefaults] integerForKey:self.userdefKey];
//                    if (_numberInt < 2) {
//                        if (_numberInt == 0) {
//                            [self showCustomizeSKStoreReview1];
//                        }
//                        if (_numberInt == 1) {
//                            [self showCustomizeSKStoreReview2];
//                        }
//                        return;
//                    }
//                    SOLocalize(@"The free trial period has arrived, please download the Pro version for permanent use!")
                    UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:SOLocalize(@"Tips") message:@"免费版可以正常拦截已有关键词,添加关键词属于扩展功能请下载pro版" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *okAct = [UIAlertAction actionWithTitle:@"去下载" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@", APPIDPRO];
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:nil completionHandler:^(BOOL success) {
                        }];
                    }];
                    UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    }];
                    [alertCtr addAction:cancelAct];
                    [alertCtr addAction:okAct];
                    [self presentViewController:alertCtr animated:YES completion:^{
                        NSLog(@"presented");
                    }];
                    return ;
                }
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SOLocalize(@"Please enter a keyword") message:@"" preferredStyle:UIAlertControllerStyleAlert];
                
                [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    switch (_addKeyWord) {
                        case ADDKEYWORDBLACK:
                            textField.placeholder = SOLocalize(@"Please enter Blackcontent keyword");
                            break;
                        case ADDKEYWORDWHITE:
                            textField.placeholder = SOLocalize(@"Please enter Whitecontent keyword");
                            break;
                        case ADDKEYWORDBLACKPHONE:
                            textField.placeholder = SOLocalize(@"Please enter Blacksender keyword");
                            break;
                        case ADDKEYWORDWHITEPHONE:
                            textField.placeholder = SOLocalize(@"Please enter Whitesender keyword");
                            break;
                        default:
                            break;
                    }
                }];
                
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:SOLocalize(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    UITextField *tempField = [alertController.textFields firstObject];
                    NSLog(@"ok==%@",tempField.text);
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
                        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
                        switch (_addKeyWord) {
                            case ADDKEYWORDBLACK:
                                [userDefaults setObject:keyArray forKey:KEYWORDARRAY];
                                break;
                            case ADDKEYWORDWHITE:
                                [userDefaults setObject:keyArray forKey:KEYWORDARRAY_WHITE];
                                break;
                            case ADDKEYWORDBLACKPHONE:
                                [userDefaults setObject:keyArray forKey:KEYWORDARRAY_PHONE];
                                break;
                            case ADDKEYWORDWHITEPHONE:
                                [userDefaults setObject:keyArray forKey:KEYWORDARRAY_WHITE_PHONE];
                                break;
                            default:
                                break;
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
                break;
            case 1:
                // 内容黑名单
                _addKeyWord = ADDKEYWORDBLACK;
                self.keyWordMutArray = self.blackKeyWordMutArray;
                break;
            case 2:
                // 内容白名单
                _addKeyWord = ADDKEYWORDWHITE;
                self.keyWordMutArray = self.whiteKeyWordMutArray;
                break;
            case 3:
                // 发送者黑名单
                _addKeyWord = ADDKEYWORDBLACKPHONE;
                self.keyWordMutArray = self.blackPhoneMutArray;
                break;
            case 4:
                // 发送者白名单
//                _addKeyWord = ADDKEYWORDWHITEPHONE;
//                self.keyWordMutArray = self.whitePhoneMutArray;
                // 使用帮助
                [self showHelpTipsView];
                break;
            case 5:
                // TODO:扩展
                break;
            default:
                break;
        }
        if ((index == 1 || index == 2 || index == 3) && ![self.title isEqualToString:titles[index]]) {
            self.title = titles[index];
            [self.blackTableView reloadData];
            [self.blackTableView performAnimation:AnimationRightToLeft finishBlock:nil];
            if (!self.keyWordMutArray.count) {
                NSLog(@"暂无数据。");
            }
        }
    };
    [menuView showMenuEnterAnimation:MLAnimationStyleTop];
}

/**
 显示帮助提示界面
 */
- (void)showHelpTipsView
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SOLocalize(@"Tips") message:SOLocalize(@"*Please open Settings -> SMS -> Unknown and Filter Information -> SMS Blocker\n*Whitelist first, blacklist second, whitelisted keywords, no interception, blacklisted keyword interception\n*This software only provides interception rules, will not be exposed to any SMS content, and cannot delete SMS messages\n*System restrictions 1. Only intercept non-contact numbers, 2. There will be small red dots\n*QQ group feedback 469859289") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:SOLocalize(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:^{
        NSLog(@"presented");
    }];
}

/**
 第一次弹框提示
 */
- (void)showCustomizeSKStoreReview1
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SOLocalize(@"Tips") message:SOLocalize(@"The family is poor, relying on writing code for a living. The software has no advertising and no profit, only ask for 5 stars to encourage!") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:SOLocalize(@"Go to score") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showSKStoreReview];
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:^{
        NSLog(@"presented");
    }];
}

/**
 第二次弹框提示
 */
- (void)showCustomizeSKStoreReview2
{
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:self.userdefKey];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:SOLocalize(@"Tips") message:SOLocalize(@"Please write a comment, if you don't want to write, just go back and just encourage") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:SOLocalize(@"Go to comment") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showSKStoreReview];
    }];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:SOLocalize(@"Back") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//    }];
//    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:^{
        NSLog(@"presented");
    }];
}

#pragma mark - 关于评分和评论
// 显示打分评论
- (void)showSKStoreReview
{
    if([SKStoreReviewController respondsToSelector:@selector(requestReview)] && _numberInt == 0) {// iOS 10.3 以上支持
        [SKStoreReviewController requestReview];
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:self.userdefKey];
    }
    else { // iOS 10.3 之前的使用这个
        NSString *appId = APPID;
        if ([BUNDLEID isEqualToString:PURESMSPRO]) {
            appId = APPIDPRO;
        }
        //替换为对应的APPID
        NSString  *nsStringToOpen = [NSString  stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@?action=write-review",appId];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen] options:[NSDictionary new] completionHandler:^(BOOL success) {
            if (success) {
                [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:self.userdefKey];
            }
        }];
    }
}

/**
 应用内跳转到App Store页。打分和评论
 */
- (void)jump {
    
    NSString *appId = APPID;
    if ([BUNDLEID isEqualToString:PURESMSPRO]) {
        appId = APPIDPRO;
    }
    // 创建对象
    SKStoreProductViewController *storeVC = [[SKStoreProductViewController alloc] init];
    // 设置代理
    storeVC.delegate = self;
    // 初始化参数
    NSDictionary *dict = [NSDictionary dictionaryWithObject:appId forKey:SKStoreProductParameterITunesItemIdentifier];
    
    // 跳转App Store页
    [storeVC loadProductWithParameters:dict completionBlock:^(BOOL result, NSError * _Nullable error) {
        if (error) {
            NSLog(@"错误信息：%@",error.userInfo);
        }
        else
        {
            // 弹出模态视图
            [self presentViewController:storeVC animated:YES completion:nil];
        }
    }];
    
}


#pragma mark - SKStoreProductViewControllerDelegate
/**
 SKStoreProductViewControllerDelegate 方法，选择完成之后的处理
 
 @param viewController SKStoreProductViewController
 */
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"完成");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:self.userdefKey];
    }];
}

#pragma mark - 点击事件
- (IBAction)leftButEvent:(UIBarButtonItem *)sender {
    self.userdefKey = @"isLeftBtn";
    _numberInt = [[NSUserDefaults standardUserDefaults] integerForKey:self.userdefKey];
    if (_numberInt < 2) {
        if (_numberInt == 0) {
            [self showCustomizeSKStoreReview1];
        }
        if (_numberInt == 1) {
            [self showCustomizeSKStoreReview2];
        }
        return;
    }
    [self getKeyWord];
    if (_isBlack) {
        _isBlack = NO;
        self.title = SOLocalize(@"SMS filtering white list");
        sender.title = SOLocalize(@"Blacklist");
        [_leftBut setTitle:SOLocalize(@"Blacklist") forState:UIControlStateNormal];
        self.keyWordMutArray = self.whiteKeyWordMutArray;
    }
    else {
        _isBlack = YES;
        self.title = SOLocalize(@"SMS filtering black list");
        sender.title = SOLocalize(@"Whitelist");
        [_leftBut setTitle:SOLocalize(@"Whitelist") forState:UIControlStateNormal];
        self.keyWordMutArray = self.blackKeyWordMutArray;
    }
    [self.blackTableView reloadData];
    [self.blackTableView performAnimation:AnimationRightToLeft finishBlock:nil];
}

- (IBAction)rightButEvent:(UIBarButtonItem *)sender {
    
    NSArray *array = @[SOLocalize(@"Add Keyword"), SOLocalize(@"SMS Blackcontent"), SOLocalize(@"SMS Whitecontent"), SOLocalize(@"SMS Blacksender"), SOLocalize(@"Using Helpe")];
    [self loadMLMenuWithTitles:array];
}

#pragma mark - cell子事件
- (void)cellSwitch:(UISwitch *) sender
{
    NSLog(@"sender.tag == %ld", sender.tag);
    if (sender.tag >= self.keyWordMutArray.count) {
        return;
    }
    SOKeywordModelExt *keyModel = [NSKeyedUnarchiver unarchiveObjectWithData:self.keyWordMutArray[sender.tag]];
    keyModel.isOpen = sender.on;
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:keyModel];
    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:self.keyWordMutArray];
    [mutArray replaceObjectAtIndex:sender.tag withObject:data];
    self.keyWordMutArray = mutArray;
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
    switch (_addKeyWord) {
        case ADDKEYWORDBLACK:
            [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY];
            break;
        case ADDKEYWORDWHITE:
            [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY_WHITE];
            break;
        case ADDKEYWORDBLACKPHONE:
            [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY_PHONE];
            break;
        case ADDKEYWORDWHITEPHONE:
            [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY_WHITE_PHONE];
            break;
        default:
            break;
    }
    [userDefaults synchronize];
}

- (void)cellDelete:(UIButton *) sender
{
    NSLog(@"sender.tag == %ld", sender.tag);
    [self tableView:self.blackTableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0]];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.keyWordMutArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SOBlackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SOBlackTableViewCell" forIndexPath:indexPath];
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    if (indexPath.row < self.keyWordMutArray.count) {
        SOKeywordModelExt *keyModel = [NSKeyedUnarchiver unarchiveObjectWithData:self.keyWordMutArray[indexPath.row]];
        cell.cellLabel.text = keyModel.keywordStr;
        cell.cellSwitch.on = keyModel.isOpen;
        
        cell.cellSwitch.tag = indexPath.row;
        [cell.cellSwitch addTarget:self action:@selector(cellSwitch:) forControlEvents:UIControlEventValueChanged];
        cell.cellDelete.tag = indexPath.row;
        [cell.cellDelete addTarget:self action:@selector(cellDelete:) forControlEvents:UIControlEventTouchUpInside];
    }
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
        
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
        switch (_addKeyWord) {
            case ADDKEYWORDBLACK:
                [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY];
                break;
            case ADDKEYWORDWHITE:
                [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY_WHITE];
                break;
            case ADDKEYWORDBLACKPHONE:
                [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY_PHONE];
                break;
            case ADDKEYWORDWHITEPHONE:
                [userDefaults setObject:self.keyWordMutArray forKey:KEYWORDARRAY_WHITE_PHONE];
                break;
            default:
                break;
        }
        [userDefaults synchronize];
        
        [self.blackTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self.blackTableView reloadData];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NSLocalizedString(@"Delete", nil);
}

#pragma mark - 懒加载
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

- (NSMutableArray *)whitePhoneMutArray
{
    if (!_whitePhoneMutArray) {
        _whitePhoneMutArray = [NSMutableArray array];
    }
    return _whitePhoneMutArray;
}

- (NSMutableArray *)blackPhoneMutArray
{
    if (!_blackPhoneMutArray) {
        _blackPhoneMutArray = [NSMutableArray array];
    }
    return _blackPhoneMutArray;
}

@end
