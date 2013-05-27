//
//  HotelRoomCancellationResponse.h
//  Booker
//
//  Created by JinNan on 5/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EanWsError.h"

@interface HotelRoomCancellationResponse : NSObject

@property NSString *customerSessionId;
@property NSString *cancellationNumber;
@property EanWsError *eanWsError;

- (id) initWithDictionary:(NSDictionary *)dictionary;

@end
