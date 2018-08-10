//
//  SOPayViewController.m
//  PureSms
//
//  Created by YC X on 2018/8/6.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "SOPayViewController.h"
#import <PassKit/PassKit.h>

@interface SOPayViewController ()<PKPaymentAuthorizationViewControllerDelegate>

@end

@implementation SOPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                       didAuthorizePayment:(PKPayment *)payment
                                completion:(void (^)(PKPaymentAuthorizationStatus status))completion
{
    NSLog(@"Payment was authorized: %@", payment);
    
    completion(PKPaymentAuthorizationStatusSuccess);
    
    NSLog(@"Payment was successful");
}

- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller
{
    NSLog(@"Finishing payment view controller");
    
    // hide the payment window
    [controller dismissViewControllerAnimated:TRUE completion:nil];
}

- (IBAction)touchUpInsideBtn:(UIButton *)sender {
    
    if([PKPaymentAuthorizationViewController canMakePayments]) {
        
        NSLog(@"Woo! Can make payments!");
        
        PKPaymentRequest *request = [[PKPaymentRequest alloc] init];
        
        PKPaymentSummaryItem *widget = [PKPaymentSummaryItem summaryItemWithLabel:@"捐赠"
                                                                            amount:[NSDecimalNumber decimalNumberWithString:@"1.00"]];
        
        PKPaymentSummaryItem *total = [PKPaymentSummaryItem summaryItemWithLabel:@"重庆如梦极匠科技发展有限公司"
                                                                          amount:[NSDecimalNumber decimalNumberWithString:@"1.00"]];
        
        request.paymentSummaryItems = @[widget, total];
        request.countryCode = @"CN";
        request.currencyCode = @"CNY";
        request.supportedNetworks = @[PKPaymentNetworkChinaUnionPay, PKPaymentNetworkPrivateLabel, PKPaymentNetworkAmex];
        request.merchantIdentifier = @"merchant.welightworld.puresms";
        request.merchantCapabilities = PKMerchantCapability3DS;
        
        PKPaymentAuthorizationViewController *paymentPane = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:request];
        paymentPane.delegate = self;
        [self presentViewController:paymentPane animated:TRUE completion:nil];
        
    } else {
        NSLog(@"This device cannot make payments");
    }
}

@end
