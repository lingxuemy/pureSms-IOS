//
//  SOHomeViewController.m
//  PureSms
//
//  Created by YC X on 2021/4/24.
//  Copyright © 2021 YC X. All rights reserved.
//

#import "SOHomeViewController.h"
#import "SOHelpViewController.h"
#import "SOKeywordModelExt.h"
#import "SOBlackViewController.h"

@interface SOHomeViewController ()
{
    NSString *suiteNameStr;
}
@property (nonatomic, strong) NSMutableArray *whiteKeyWordMutArray;
@property (nonatomic, strong) NSMutableArray *blackKeyWordMutArray;
@property (weak, nonatomic) IBOutlet UITextView *whiteTextView;
@property (weak, nonatomic) IBOutlet UITextView *blackTextView;

@end

@implementation SOHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    suiteNameStr = ExtentsionAppGroupName;
    if ([BUNDLEID isEqualToString:PURESMSPRO]) {
        suiteNameStr = ExtentsionAppGroupNamePro;
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.whiteTextView.text = @"未添加任何关键词（点击空白处添加）";
    self.blackTextView.text = @"未添加任何关键词（点击空白处添加）";

    if (![[NSUserDefaults standardUserDefaults] integerForKey:@"isFirst"]) {
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"isFirst"];
        SOHelpViewController *helpVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SOHelpViewController"];
        [self.navigationController pushViewController:helpVC animated:YES];
        
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
    else {
        [self getKeyWord];
    }
    
    
    if (self.whiteKeyWordMutArray.count) {
        for (NSData *tempData in self.whiteKeyWordMutArray) {
            
            SOKeywordModelExt *model = [NSKeyedUnarchiver unarchiveObjectWithData:tempData];
            
            if (model.isOpen) {
                if ([self.whiteTextView.text isEqualToString:@"未添加任何关键词（点击空白处添加）"]) {
                    self.whiteTextView.text = model.keywordStr;
                }
                else {
                    self.whiteTextView.text = [self.whiteTextView.text stringByAppendingFormat:@"、%@", model.keywordStr];
                }
            }
        }
    }
    
    if (self.blackKeyWordMutArray.count) {
        for (NSData *tempData in self.blackKeyWordMutArray) {
            
            SOKeywordModelExt *model = [NSKeyedUnarchiver unarchiveObjectWithData:tempData];

            if (model.isOpen) {
                if ([self.blackTextView.text isEqualToString:@"未添加任何关键词（点击空白处添加）"]) {
                    self.blackTextView.text = model.keywordStr;
                }
                else {
                    self.blackTextView.text = [self.blackTextView.text stringByAppendingFormat:@"、%@", model.keywordStr];
                }
            }
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"whiteSegue"]) {
        SOBlackViewController *blackView = [segue destinationViewController];
        blackView.typeInt = 0;
    }
    if ([[segue identifier] isEqualToString:@"blackSegue"]) {
        SOBlackViewController *blackView = [segue destinationViewController];
        blackView.typeInt = 1;
    }
    
}

- (IBAction)tapEvent:(UITapGestureRecognizer *)sender {
    if (sender.view.tag == 0) {
        SOBlackViewController *blackView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SOBlackViewController"];
        blackView.typeInt = 0;
        [self.navigationController pushViewController:blackView animated:YES];
    }
    else if (sender.view.tag == 1) {
        SOBlackViewController *blackView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SOBlackViewController"];
        blackView.typeInt = 1;
        [self.navigationController pushViewController:blackView animated:YES];
    }
}

- (void)getKeyWord
{
    NSUserDefaults *whiteUserDef = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
    self.whiteKeyWordMutArray = [whiteUserDef objectForKey:KEYWORDARRAY_WHITE];
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:suiteNameStr];
    self.blackKeyWordMutArray = [userDefaults objectForKey:KEYWORDARRAY];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 1) {
        return (self.view.frame.size.height-UIApplication.sharedApplication.windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height-self.navigationController.navigationBar.frame.size.height-80)/2;
    }
    else {
        return 80;
    }
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
