//
//  LHSignal.h
//  LighthouseKit
//
//  Created by Erik Madsen on 11/2/16.
//  Copyright © 2016 Off Madison Ave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHSignalCategory.h"

@interface LHSignal : NSObject

@property (nonatomic, retain) NSString* id;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* alert;
@property (nonatomic, retain) NSString* body;
@property (nonatomic, retain) NSDictionary* payload;
@property (nonatomic, retain) LHSignalCategory* category;
@property (nonatomic, retain) NSArray<NSString *> *tags;
@property (nonatomic, retain) NSDate* createdAt;
@property (nonatomic, retain, nullable) NSDate* lastViewAt;
@property (nonatomic, retain) NSNumber* viewCount;

+(LHSignal*) initWithDict:(NSDictionary*)dict;
-(NSDictionary*) dictionary;

@end
