//
//  PingResponse.h
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EanWsError.h"

@interface PingResponse : NSObject

@property NSString *customerSessionId;
@property NSString *echo;
@property EanWsError *eanWsError;

-(id) initWithDictionary:(NSDictionary *)dictionary;
@end
