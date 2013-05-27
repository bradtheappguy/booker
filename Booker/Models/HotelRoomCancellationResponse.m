//
//  HotelRoomCancellationResponse.m
//  Booker
//
//  Created by JinNan on 5/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelRoomCancellationResponse.h"

@implementation HotelRoomCancellationResponse

- (id) initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        self.eanWsError = [[EanWsError alloc] initWithDictionery:[dictionary objectForKey:@"EanWsError"]];
        self.customerSessionId = [dictionary objectForKey:@"customerSessionId"];
        self.cancellationNumber = [dictionary objectForKey:@"cancellationNumber"];
        //TODO
        
    }
    return self;
}

@end
