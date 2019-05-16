//
//  HsBaseRequest.m
//  KeyChainProject
//
//  Created by realcloud on 2019/5/16.
//  Copyright © 2019年 realcloud. All rights reserved.
//

#import "HsBaseRequest.h"
#import "SSNetworkConfiguration.h"
@interface HsBaseRequest ()
- (NSString *)apiPath;
- (void)showNetworkMsgInfo:(NSString *)msg;
@end

@implementation HsBaseRequest
- (NSString *)apiPath{
    return @"123456";
}
- (BOOL)handleResponse:(id)response withRequest:(HsBaseRequest *)request{
    if ([[request apiPath] isEqualToString:@"www.baidu.com"]) {
        if ([response isKindOfClass:[NSDictionary class]]) {
            NSDictionary *rep = (NSDictionary *)response;
            NSNumber *result = rep[@"result"];
            if (result.boolValue) {
                //return %orig;
            }
            else{
                NSString *msg = rep[@"msg"];
                [self showNetworkMsgInfo:msg];
                return YES;
            }
        }
    }
    else{
        //return %orig;
        return YES;
    }
    //return %orig;
    return YES;
}
@end
