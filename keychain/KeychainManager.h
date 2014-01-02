//
//  KeychainManager.h
//  keychain
//
//  Created by Alex Reynolds on 1/2/14.
//  Copyright (c) 2014 Alex Reynolds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainManager : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

@end
