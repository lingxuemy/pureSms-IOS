//
//  MessageFilterExtension.m
//  PureSmsExt
//
//  Created by YC X on 2018/4/9.
//  Copyright © 2018年 YC X. All rights reserved.
//

#import "MessageFilterExtension.h"
#import "SOKeywordModelExt.h"

#define ExtentsionAppGroupName @"group.com.welightworld.puresms"
#define KEYWORDARRAY @"KEYWORDARRAY"

@interface MessageFilterExtension () <ILMessageFilterQueryHandling>
@end

@implementation MessageFilterExtension

#pragma mark - ILMessageFilterQueryHandling

- (void)handleQueryRequest:(ILMessageFilterQueryRequest *)queryRequest context:(ILMessageFilterExtensionContext *)context completion:(void (^)(ILMessageFilterQueryResponse *))completion {
    // First, check whether to filter using offline data (if possible).
    ILMessageFilterAction offlineAction = [self offlineActionForQueryRequest:queryRequest];
    
    switch (offlineAction) {
        case ILMessageFilterActionAllow:
        case ILMessageFilterActionFilter: {
            // Based on offline data, we know this message should either be Allowed or Filtered. Send response immediately.
            ILMessageFilterQueryResponse *response = [[ILMessageFilterQueryResponse alloc] init];
            response.action = offlineAction;
            
            completion(response);
            break;
        }
            
        case ILMessageFilterActionNone: {
            // Based on offline data, we do not know whether this message should be Allowed or Filtered. Defer to network.
            // Note: Deferring requests to network requires the extension target's Info.plist to contain a key with a URL to use. See documentation for details.
            [context deferQueryRequestToNetworkWithCompletion:^(ILNetworkResponse *_Nullable networkResponse, NSError *_Nullable error) {
                ILMessageFilterQueryResponse *response = [[ILMessageFilterQueryResponse alloc] init];
                response.action = ILMessageFilterActionNone;
                
                if (networkResponse) {
                    // If we received a network response, parse it to determine an action to return in our response.
                    response.action = [self actionForNetworkResponse:networkResponse];
                } else {
                    NSLog(@"Error deferring query request to network: %@", error);
                }
                
                completion(response);
            }];
            break;
        }
    }
}

- (ILMessageFilterAction)offlineActionForQueryRequest:(ILMessageFilterQueryRequest *)queryRequest {
    // Replace with logic to perform offline check whether to filter first (if possible).
    NSString *messageContent = queryRequest.messageBody;
    if ([messageContent rangeOfString:@"验证码"].length || [messageContent rangeOfString:@"验证"].length || [messageContent rangeOfString:@"码"].length) {
        return ILMessageFilterActionAllow;
    }
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:ExtentsionAppGroupName];
    NSArray *userDefArray = [userDefaults objectForKey:KEYWORDARRAY];
    for (NSData *data in userDefArray) {
        SOKeywordModelExt *keyModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if (keyModel.isOpen && [messageContent rangeOfString:keyModel.keywordStr].length) {
            return ILMessageFilterActionFilter;
        }
    }
    return ILMessageFilterActionAllow;
}

- (ILMessageFilterAction)actionForNetworkResponse:(ILNetworkResponse *)networkResponse {
    // Replace with logic to parse the HTTP response and data payload of `networkResponse` to return an action.
    return ILMessageFilterActionNone;
}

@end
