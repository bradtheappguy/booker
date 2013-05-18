//
//  RateInfo.h
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChargableRateInfo.h"

@interface RateInfo : NSObject

@property (nonatomic) NSString *rateCharge;
@property (nonatomic) NSString *promo;
@property (nonatomic) NSString *priceBreakdown;

@property (nonatomic) ChargableRateInfo *charageableRateInfo;


-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
