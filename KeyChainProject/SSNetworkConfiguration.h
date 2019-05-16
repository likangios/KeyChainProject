//
//  SSNetworkConfiguration.h
//  KeyChainProject
//
//  Created by realcloud on 2019/5/16.
//  Copyright © 2019年 realcloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSNetworkConfiguration : NSObject
+(id)sharedInstance;
- (void)clearSession;
@end
