#import <HMSWebRTC/RTCMacros.h>
#import <HMSWebRTC/RTCVideoEncoder.h>
#import <HMSWebRTC/RTCVideoEncoderFactory.h>
#import <HMSWebRTC/RTCVideoCodecInfo.h>

RTC_OBJC_EXPORT
@interface RTC_OBJC_TYPE (RTCVideoEncoderSimulcast) : NSObject

+ (id<RTC_OBJC_TYPE(RTCVideoEncoder)>)simulcastEncoderWithPrimary:(id<RTC_OBJC_TYPE(RTCVideoEncoderFactory)>)primary
                                                         fallback:(id<RTC_OBJC_TYPE(RTCVideoEncoderFactory)>)fallback
                                                   videoCodecInfo:(RTC_OBJC_TYPE(RTCVideoCodecInfo) *)videoCodecInfo;

@end
