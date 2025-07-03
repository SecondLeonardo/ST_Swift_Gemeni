//
//  HMSVideoPlugin.h
//  HMSSDK
//
//  Created by Dmitry Fedoseyev on 21.04.2022.
//  Copyright © 2022 100ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreVideo/CoreVideo.h>
#import <ImageIO/ImageIO.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMSVideoFrameInfo : NSObject
@property (nonatomic, readonly) CGImagePropertyOrientation orientation;
@property (nonatomic, readonly) int width;
@property (nonatomic, readonly) int height;

- (instancetype)initWithOrientation:(CGImagePropertyOrientation)orientation width:(int)width height:(int)height;
@end



@interface HMSVideoPlugin : NSObject
@property (nonatomic, strong, nullable) HMSVideoFrameInfo *frameInfo;
@property (nonatomic, copy, nullable) void (^onFrameInfoChange)(HMSVideoFrameInfo *);

- (void)activate;
- (void)deactivate;

- (CVPixelBufferRef)process:(CVPixelBufferRef)frame CF_RETURNS_RETAINED;

- (dispatch_queue_t)frameProcessingQueue;
@end

NS_ASSUME_NONNULL_END
