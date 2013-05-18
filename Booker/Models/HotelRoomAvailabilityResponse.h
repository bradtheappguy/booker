//
//  HotelRoomAvailabilityResponse.h
//  Booker
//
//  Created by Brad Smith on 5/8/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EanWsError.h"

@interface HotelRoomAvailabilityResponse : NSObject

@property NSString *customerSessionId;
@property EanWsError *eanWsError;

-(id) initWithDictionary:(NSDictionary *)dictionary;
@end
