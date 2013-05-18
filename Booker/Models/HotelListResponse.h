//
//  HotelListResponse.h
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EanWsError.h"

@interface HotelListResponse : NSObject
@property EanWsError *eanWsError;
@property NSString *customerSessionId;
@property NSNumber *moreResultsAvailable;
@property NSNumber *numberOfRoomsRequested;
@property NSMutableArray *hotelSummaries;

@property NSString *cacheKey;
@property NSString *cacheLocation;
/*

 cacheKey
 cacheLocation
 
 
 
 NSArray *RoomRateDetails;
 
 NSArray *valueAdds;
 
 NSArray *rateInfos;
 
 NSArray *nightlyRates;
 
 NSArray *surcharges;
 
 NSString *rateType;
 
 NSArray *hotelFees;
 
 NSDictionary *convertedRateInfo;
 
 NSDictionary *roomGroup;
 
*/

-(id) initWithDictionary:(NSDictionary *)dictionary;


@end
