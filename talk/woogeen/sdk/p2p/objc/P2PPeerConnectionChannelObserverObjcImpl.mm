/*
 * Intel License
 */

#import <Foundation/Foundation.h>
#import "talk/woogeen/sdk/base/objc/RTCRemoteStream+Internal.h"

#include "talk/woogeen/sdk/p2p/objc/P2PPeerConnectionChannelObserverObjcImpl.h"

namespace woogeen {
P2PPeerConnectionChannelObserverObjcImpl::P2PPeerConnectionChannelObserverObjcImpl(id<RTCP2PPeerConnectionChannelObserver> observer) {
  _observer = observer;
}

void P2PPeerConnectionChannelObserverObjcImpl::OnInvited(const std::string& remote_id) {
  [_observer onInvitedFrom:[NSString stringWithUTF8String:remote_id.c_str()]];
}

void P2PPeerConnectionChannelObserverObjcImpl::OnAccepted(const std::string& remote_id) {
}

void P2PPeerConnectionChannelObserverObjcImpl::OnStopped(const std::string& remote_id) {
}

void P2PPeerConnectionChannelObserverObjcImpl::OnDenied(const std::string& remote_id) {
}

void P2PPeerConnectionChannelObserverObjcImpl::OnStreamAdded(std::shared_ptr<woogeen::RemoteStream> stream) {
  RTCRemoteStream* remote_stream = [[RTCRemoteStream alloc]initWithNativeStream: stream];
  [_observer onStreamAdded: remote_stream];
  NSLog(@"On stream added.");
}

void P2PPeerConnectionChannelObserverObjcImpl::OnStreamRemoved(std::shared_ptr<woogeen::RemoteStream> stream) {
  RTCRemoteStream* remote_stream = [[RTCRemoteStream alloc]initWithNativeStream: stream];
  [_observer onStreamRemoved: remote_stream];
  NSLog(@"On stream removed.");
}
}