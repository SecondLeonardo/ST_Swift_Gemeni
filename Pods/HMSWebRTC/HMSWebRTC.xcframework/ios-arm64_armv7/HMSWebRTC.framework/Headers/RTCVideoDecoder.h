/*
 *  Copyright 2017 The WebRTC project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#import <Foundation/Foundation.h>

#import <HMSWebRTC/RTCCodecSpecificInfo.h>
#import <HMSWebRTC/RTCEncodedImage.h>
#import <HMSWebRTC/RTCMacros.h>
#import <HMSWebRTC/RTCVideoEncoderSettings.h>
#import <HMSWebRTC/RTCVideoFrame.h>

NS_ASSUME_NONNULL_BEGIN

/** Callback block for decoder. */
typedef void (^RTCVideoDecoderCallback)(RTC_OBJC_TYPE(RTCVideoFrame) * frame);

/** Protocol for decoder implementations. */
RTC_OBJC_EXPORT
@protocol RTC_OBJC_TYPE
(RTCVideoDecoder)<NSObject>

    - (void)setCallback : (RTCVideoDecoderCallback)callback;
- (NSInteger)startDecodeWithNumberOfCores:(int)numberOfCores;
- (NSInteger)releaseDecoder;
// TODO(bugs.webrtc.org/15444): Remove obsolete missingFrames param.
- (NSInteger)decode:(RTC_OBJC_TYPE(RTCEncodedImage) *)encodedImage
        missingFrames:(BOOL)missingFrames
    codecSpecificInfo:(nullable id<RTC_OBJC_TYPE(RTCCodecSpecificInfo)>)info
         renderTimeMs:(int64_t)renderTimeMs;
- (NSString *)implementationName;

@end

NS_ASSUME_NONNULL_END
