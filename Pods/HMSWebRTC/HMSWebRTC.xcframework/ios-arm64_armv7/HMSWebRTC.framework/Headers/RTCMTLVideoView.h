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

#import <HMSWebRTC/RTCMacros.h>
#import <HMSWebRTC/RTCVideoFrame.h>
#import <HMSWebRTC/RTCVideoRenderer.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * RTCMTLVideoView is thin wrapper around MTKView.
 *
 * It has id<RTCVideoRenderer> property that renders video frames in the view's
 * bounds using Metal.
 */
NS_CLASS_AVAILABLE_IOS(9)

RTC_OBJC_EXPORT
@interface RTC_OBJC_TYPE (RTCMTLVideoView) : UIView<RTC_OBJC_TYPE(RTCVideoRenderer)>

@property(nonatomic, weak) id<RTC_OBJC_TYPE(RTCVideoViewDelegate)> delegate;

@property(nonatomic) UIViewContentMode videoContentMode;

/** @abstract Enables/disables rendering.
 */
@property(nonatomic, getter=isEnabled) BOOL enabled;

/** @abstract Wrapped RTCVideoRotation, or nil.
 */
@property(nonatomic, nullable) NSValue* rotationOverride;

@end

NS_ASSUME_NONNULL_END
