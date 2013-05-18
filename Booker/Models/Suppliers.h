//
//  Suppliers.h
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Suppliers : NSObject

@property (nonatomic) NSString *chainCode;
@property (nonatomic) NSString *chainId;

-(id) initWithDictionary:(NSDictionary *)dictionary;


@end
