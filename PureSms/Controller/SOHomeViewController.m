//
//  SOHomeViewController.m
//  PureSms
//
//  Created by YC X on 2021/4/24.
//  Copyright © 2021 YC X. All rights reserved.
//

#import "SOHomeViewController.h"
#import "SOHelpViewController.h"

@interface SOHomeViewController ()

@end

@implementation SOHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (![[NSUserDefaults standardUserDefaults] integerForKey:@"isFirst"]) {
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"isFirst"];
        SOHelpViewController *helpVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SOHelpViewController"];
        [self.navigationController pushViewController:helpVC animated:YES];
    }
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

@end
