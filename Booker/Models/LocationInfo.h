//
//  LocationInfo.h
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationInfo : NSObject
@property (nonatomic) NSString *destinationId;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *stateProvinceCode;
@property (nonatomic) NSString *countryCode;
@property (nonatomic) NSString *countryName;
@property (nonatomic) NSString *code;

//Boolean
@property (nonatomic) NSNumber *active;
@property (nonatomic) NSNumber *locationInDestination;


//Int
@property (nonatomic) NSNumber *type;
@property (nonatomic) NSNumber *geoAccuracy;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;
@property (nonatomic) NSNumber *refLocationMilage;
@property (nonatomic) NSNumber *activePropertyCount;

-(id) initWithDictionary:(NSDictionary *)dictionary;



@end
