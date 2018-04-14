//
//  SOConditionViewController.m
//  PureSms
//
//  Created by YC X on 2018/4/13.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "SOConditionViewController.h"
#import "SOConditionTableViewCell.h"

#define SOLocalize(key) NSLocalizedString(key, nil)
#define ExtentsionAppGroupName @"group.com.welightworld.puresms"
#define KEYWORDARRAY @"KEYWORDARRAY"

@interface SOConditionViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSString *keyWordStr;
@property (nonatomic, strong) NSArray *difKeyWordArray;
@property (weak, nonatomic) IBOutlet UITableView *conditionTableView;

@end

@implementation SOConditionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.difKeyWordArray = @[SOLocalize(@"Keyword"), @"", SOLocalize(@"Please enter a keyword or Please select a keyword"), SOLocalize(@"Reply"), SOLocalize(@"Unsubscribe"), SOLocalize(@"Regal"), SOLocalize(@"Macao"), SOLocalize(@"Casino"), SOLocalize(@"Download"), SOLocalize(@"Registered"), SOLocalize(@"Securities"), SOLocalize(@"Financial management"), SOLocalize(@"Income"), SOLocalize(@"Insurance"), SOLocalize(@"Participate"), SOLocalize(@"Click on"), SOLocalize(@"Fund"), SOLocalize(@"Share"), SOLocalize(@"Stamp"), SOLocalize(@"Loan"), SOLocalize(@"Voucher"), SOLocalize(@"www"), SOLocalize(@"http"), SOLocalize(@".cn"), SOLocalize(@".com")];
    [self.conditionTableView registerNib:[UINib nibWithNibName:@"SOConditionTableViewCell" bundle:nil] forCellReuseIdentifier:@"SOConditionTableViewCell"];

}

- (IBAction)rightButEvent:(UIBarButtonItem *)sender {
    SOConditionTableViewCell *cellKeyWordStr = [self.conditionTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    self.keyWordStr = cellKeyWordStr.keyWordTextField.text;
    
    NSArray *keyWordArray = [self.keyWordStr componentsSeparatedByString:@";"];
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
    NSMutableArray *keyWordMutArray = [NSMutableArray arrayWithArray:[userDefaults objectForKey:KEYWORDARRAY]];
    
    keyWordMutArray = [keyWordMutArray arrayByAddingObjectsFromArray:keyWordArray].mutableCopy;
    [userDefaults setObject:keyWordMutArray forKey:KEYWORDARRAY];
    [userDefaults synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.difKeyWordArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SOConditionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SOConditionTableViewCell" forIndexPath:indexPath];
    cell.separatorInset = UIEdgeInsetsZero;
    if (indexPath.row >= 3) {
        cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    if (indexPath.row == 0 || indexPath.row == 2) {
        cell.userInteractionEnabled = NO;
        cell.label.font = [UIFont systemFontOfSize:13];
        cell.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    }
    else {
        cell.label.font = [UIFont systemFontOfSize:16];
        cell.backgroundColor = [UIColor whiteColor];
    }
    if (indexPath.row == 1) {
        cell.keyWordTextField.hidden = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        cell.keyWordTextField.hidden = YES;
    }
    cell.label.text = self.difKeyWordArray[indexPath.row];
    cell.image.hidden = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 3) {
        return;
    }
    SOConditionTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.image.hidden) {
        cell.image.hidden = NO;
        if (!self.keyWordStr.length) {
            self.keyWordStr = cell.label.text;
        }
        else if (![self.keyWordStr rangeOfString:cell.label.text].length) {
            self.keyWordStr = [NSString stringWithFormat:@"%@;%@", self.keyWordStr, cell.label.text];
        }
    }
    else {
        cell.image.hidden = YES;
        if ([self.keyWordStr rangeOfString:cell.label.text].length) {
            if ([self.keyWordStr rangeOfString:[NSString stringWithFormat:@"%@;", cell.label.text]].length) {
                self.keyWordStr = [self.keyWordStr stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@;", cell.label.text] withString:@""];
            }
            else if ([self.keyWordStr rangeOfString:[NSString stringWithFormat:@";%@", cell.label.text]].length) {
                self.keyWordStr = [self.keyWordStr stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@";%@", cell.label.text] withString:@""];
            }
            else {
                self.keyWordStr = @"";
            }
        }
    }
    SOConditionTableViewCell *cellKeyWordStr = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    cellKeyWordStr.keyWordTextField.text = self.keyWordStr;
}

@end
