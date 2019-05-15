//
//  LHConstants.h
//  LighthouseKit
//
//  Created by Erik Madsen on 9/14/15.
//  Copyright © 2015 Off Madison Ave. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const APIServerProd;
FOUNDATION_EXPORT NSString *const APIServerDemo;
FOUNDATION_EXPORT NSString *const APIServerStaging;
FOUNDATION_EXPORT NSString *const APIServerLocal;

FOUNDATION_EXPORT NSString *const LHUserDefaultsKeyAppDeviceId;
FOUNDATION_EXPORT NSString *const LHUserDefaultsKeyPushToken;
FOUNDATION_EXPORT NSString *const LHUserDefaultsKeyAccountUserId;
FOUNDATION_EXPORT NSString *const LHUserDefaultsBluetoothOffSent;

@interface LHConstants : NSObject

@end
