//
//  AppDelegate.m
//  PureSms
//
//  Created by YC X on 2018/4/9.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>
#import <StoreKit/StoreKit.h>

#define BUNDLEID [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define PURESMSPRO @"com.welightworld.puresmspro"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([BUNDLEID isEqualToString:PURESMSPRO]) {
        [Bugly startWithAppId:@"82efa88407"];
    }
    else {
        [Bugly startWithAppId:@"2051f9e8c8"];
    }
    // 内购
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
    return YES;
}

// 监听购买结果
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transaction{
    for(SKPaymentTransaction *tran in transaction){
        NSLog(@"transactionState == %@", tran.payment.applicationUsername);
        switch (tran.transactionState) {
            case SKPaymentTransactionStatePurchased:
                NSLog(@"交易完成");
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"VIP"];
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                break;
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"商品添加进列表");
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"VIP"];
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"已经购买过商品");
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"VIP"];
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"交易失败");
                [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"VIP"];
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                break;
            default:
                break;
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
