//
//  RTCProcessingController.h
//
//  Created by Arthur Hayrapetyan on 26.01.23.
//  Copyright © 2023 Krisp Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HMSWebRTC/RTCMacros.h>

NS_ASSUME_NONNULL_BEGIN

@class RTC_OBJC_TYPE(RTCAudioProcessing);

RTC_OBJC_EXPORT
@protocol RTC_OBJC_TYPE(RTCAudioProcessorDelegate) <NSObject>
- (void)initializeProcessor;
- (void)initializeSession:(size_t)sampleRateHz numChannels:(size_t)numChannels;
- (void)name;
- (void)frameProcess:(size_t)channelNumber numBands:(size_t)numBands bufferSize:(size_t)bufferSize buffer:(float * _Nonnull)buffer;
- (void)destroyed;
- (void)reset;
- (RTC_OBJC_TYPE(RTCAudioProcessing) *)getProcessingModule;
@end

RTC_OBJC_EXPORT
@interface RTC_OBJC_TYPE (RTCProcessingController) : NSObject

- (instancetype)initWithDelegate:(id<RTC_OBJC_TYPE(RTCAudioProcessorDelegate)>)processorDelegate;
- (RTC_OBJC_TYPE(RTCAudioProcessing)*) getProcessor;

@end

NS_ASSUME_NONNULL_END
