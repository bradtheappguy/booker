//
//  ChargableRateInfo.h
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChargableRateInfo : NSObject

@property (nonatomic) NSString *total;
@property (nonatomic) NSString *surchargeTotal;
@property (nonatomic) NSString *nightlyRateTotal;
@property (nonatomic) NSString *maxNightlyRate;
@property (nonatomic) NSString *currencyCode;
@property (nonatomic) NSString *commissionableUsdTotal;
@property (nonatomic) NSString *averageRate;
@property (nonatomic) NSString *averageBaseRate;

@property (nonatomic) NSMutableArray *nightlyRates;
@property (nonatomic) NSMutableArray *surcharges;


-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
