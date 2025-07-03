//
//  HMSLocalAudioTrack.h
//  HMSSDK
//
//  Created by Dmitry Fedoseyev on 23.03.2021.
//  Copyright © 2021 100ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMSAudioTrack.h"

@class HMSAudioTrackSettings;
@class HMSRTCAudioTrack;

NS_ASSUME_NONNULL_BEGIN

@interface HMSLocalAudioTrack : HMSAudioTrack
@property (nonatomic, copy) HMSAudioTrackSettings *settings;

- (void)setMute:(BOOL)mute;

@end

NS_ASSUME_NONNULL_END
