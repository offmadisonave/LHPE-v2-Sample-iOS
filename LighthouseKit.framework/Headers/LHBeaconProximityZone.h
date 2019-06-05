//
//  LHBeaconProximityZone.h
//  LighthouseKit
//
//  Created by Erik Madsen on 5/31/19.
//  Copyright © 2019 Off Madison Ave. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHBeaconProximityZone : NSObject

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* tag;
@property (nonatomic, retain) NSNumber* range;

+(LHBeaconProximityZone*) initWithDict:(NSDictionary*)dict;
-(NSDictionary*) dictionary;

@end
