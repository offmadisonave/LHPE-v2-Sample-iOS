//
//  LHSignalCategory.h
//  LighthouseKit
//
//  Created by Erik Madsen on 11/2/16.
//  Copyright © 2016 Off Madison Ave. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface LHSignalCategory : NSObject

@property (nonatomic, retain) NSNumber* id;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* icon;
@property (nonatomic, retain) NSString* color;
@property (nonatomic, retain) NSDictionary* data;

+(LHSignalCategory*) initWithDict:(NSDictionary*)dict;

@end
