//
//  RoomRateDetail.h
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RateInfo.h"

@interface RoomRateDetail : NSObject

@property (nonatomic) NSNumber *roomTypeCode;
@property (nonatomic) NSNumber *rateCode;
@property (nonatomic) NSNumber *maxRoomOccupancy;
@property (nonatomic) NSNumber *quotedRoomOccupancy;
@property (nonatomic) NSNumber *minGuestAge;
@property (nonatomic) NSString *roomDescription;
@property (nonatomic) NSNumber *promoId;
@property (nonatomic) NSString *promoDescription;
@property (nonatomic) NSString *promoDetailText;
@property (nonatomic) NSNumber *currentAllotment;
@property (nonatomic) NSNumber *propertyAvailable;
@property (nonatomic) NSNumber *propertyRestricted;
@property (nonatomic) NSNumber *expediaPropertyId;
@property (nonatomic) NSString *rateKey;

@property (nonatomic) RateInfo *rateInfo;

//not implemented
@property (nonatomic) NSArray *bedTypes;
@property (nonatomic) NSString *smokingPreference;
@property (nonatomic) NSNumber *nonRefundable;

@property (nonatomic) NSMutableArray *valueAds;



-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
