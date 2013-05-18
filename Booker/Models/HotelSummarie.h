//
//  HotelSummaries.h
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoomRateDetail.h"
#import "HotelDetail.h"

@interface HotelSummarie : NSObject

@property (nonatomic) NSNumber *order;
@property (nonatomic) NSNumber *hotelId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address1;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *stateProvinceCode;
@property (nonatomic) NSString *countryCode;
@property (nonatomic) NSString *postalCode;
@property (nonatomic) NSString *airportCode;
@property (nonatomic) NSString *supplierType;
@property (nonatomic) NSString *propertyCategory;
@property (nonatomic) NSNumber *hotelRating;
@property (nonatomic) NSNumber *confidenceRating;
@property (nonatomic) NSString *amenityMask;
@property (nonatomic) NSString *shortDescription;
@property (nonatomic) NSString *locationDescription;
@property (nonatomic) NSString *lowRate;
@property (nonatomic) NSString *highRate;
@property (nonatomic) NSString *rateCurrencyCode;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;
@property (nonatomic) NSNumber *proximityDistance;
@property (nonatomic) NSString *proximityUnit;
@property (nonatomic) NSNumber *hotelInDestination;
@property (nonatomic) NSString *thumbNailUrl;
@property (nonatomic) NSString *deepLink;
@property (nonatomic) NSNumber *tripAdvisorRating;

@property (nonatomic) NSMutableArray *roomRateDetails;
@property (nonatomic) NSMutableString *hotelDetails;


-(id) initWithDictionary:(NSDictionary *)dictionary;
@end
