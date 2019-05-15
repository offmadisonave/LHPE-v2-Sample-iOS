//
//  LHUser.h
//  LighthouseKit
//
//  Created by Erik Madsen on 9/28/15.
//  Copyright © 2015 Off Madison Ave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHPublicConstants.h"

@interface LHUser : NSObject

@property (nonatomic, retain) NSString* externalId;
@property (nonatomic, retain) NSData* profile;

+(LHUser*) initWithExternalId:(NSString*)externalId;

-(void) saveInBackgroundWithBlock:(LHBooleanResultBlock)block;

@end
