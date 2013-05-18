//
//  Surcharge.h
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Surcharge : NSObject

@property (nonatomic) NSString *amount;
@property (nonatomic) NSString *type;

-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
