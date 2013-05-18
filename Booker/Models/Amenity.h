//
//  PropertyAmenity.h
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Amenity : NSObject
@property (nonatomic) NSString *amenity;
@property (nonatomic) NSString *amenityId;

-(id) initWithDictionary:(NSDictionary *)dictionary;
@end
