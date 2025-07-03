//
//  HMSICEServer.h
//  HMSSDK
//
//  Created by Dmitry Fedoseyev on 02.05.2024.
//  Copyright © 2024 100ms. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMSICEServer : NSObject
@property (nonatomic, copy) NSArray<NSString *> *urls;
@property (nullable, nonatomic, copy) NSString *userName;
@property (nullable, nonatomic, copy) NSString *password;

- (instancetype)initWithServerURLs:(NSArray<NSString *> *)urls userName:(nullable NSString *)userName password:(nullable NSString *)password;

@end


NS_ASSUME_NONNULL_END
