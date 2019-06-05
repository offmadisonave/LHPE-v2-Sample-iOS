//
//  Lighthouse.h
//  LighthouseKit
//
//  Created by Erik Madsen on 9/14/15.
//  Copyright © 2015 Off Madison Ave. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "LighthouseKit/LHUser.h"
#import "LighthouseKit/LHSignal.h"

@interface Lighthouse : NSObject

// Application Delegation Support
+(void) applicationWillResignActive;
+(void) applicationDidEnterBackground;
+(void) applicationWillEnterForeground;
+(void) applicationDidBecomeActive;
+(void) applicationWillTerminate;

// Status
+(BOOL) isReady;

// Device Registration
+(void) setApplicationId:(NSString *)appId clientKey:(NSString *)key environment:(NSString *)environment resultBlock:(LHBooleanResultBlock)block;
+(void) setAllowsLocation:(BOOL)allowsLocation resultBlock:(LHBooleanResultBlock)block;
+(void) setAllowsPush:(BOOL)allowsPush resultBlock:(LHBooleanResultBlock)block;
+(void) setDeviceTokenFromData:(NSData *)data;
+(void) setDeviceTokenFromString:(NSString *)token;
+(void) setDeviceProfileData:(NSData *)data;
+(NSString*) getDeviceId;

// Device Events
+(void) trackDeviceLaunch:(NSString *)signalId;

// Beaconing
+(void) getBeaconProximityZonesWithBlock:(LHBeaconProximityZonesResultBlock)block;
+(void) trackBeaconProximityZoneEntryForProximityTag:(NSString *)proximityTag;
+(void) trackBeaconProximityZoneExitForProximityTag:(NSString *)proximityTag;

// Location Tracking
+(void) startBackgroundLocationTracking;
+(void) stopBackgroundLocationTracking;
+(void) startForegroundLocationTracking;
+(void) stopForegroundLocationTracking;

// Signals
+(void) unreadSignalCountWithBlock:(LHIntegerResultBlock)block;
+(void) signalHistoryWithBlock:(LHSignalResultBlock)block;
+(void) setSignalReadWithId:(NSString*)signalId withBlock:(LHBooleanResultBlock)block;
+(void) setSignalDeletedWithId:(NSString*)signalId withBlock:(LHBooleanResultBlock)block;
+(NSURL*) urlForSignalId:(NSString *)signalId;
+(NSURLRequest*) urlRequestForSignalId:(NSString *)signalId;

@end
