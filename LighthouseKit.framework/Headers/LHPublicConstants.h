//
//  LHPublicConstants.h
//  LighthouseKit
//
//  Created by Erik Madsen on 9/28/15.
//  Copyright © 2015 Off Madison Ave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHSignal.h"

FOUNDATION_EXPORT NSString *const LHEnvironmentLocal;
FOUNDATION_EXPORT NSString *const LHEnvironmentDemo;
FOUNDATION_EXPORT NSString *const LHEnvironmentStaging;
FOUNDATION_EXPORT NSString *const LHEnvironmentProduction;

typedef void (^LHBooleanResultBlock)(BOOL succeeded, NSError *error);
typedef void (^LHSignalResultBlock)(NSArray<LHSignal *> *result, NSError *error);
typedef void (^LHIntegerResultBlock)(NSUInteger result, NSError *error);
