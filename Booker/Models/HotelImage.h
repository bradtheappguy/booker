//
//  HotelImage.h
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelImage : NSObject

@property (nonatomic) NSNumber *byteSize;
@property (nonatomic) NSNumber *category;
@property (nonatomic) NSNumber *caption;
@property (nonatomic) NSNumber *height;
@property (nonatomic) NSNumber *hotelImageId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *supplierId;
@property (nonatomic) NSString *thumbnailUrl;
@property (nonatomic) NSNumber *type;
@property (nonatomic) NSString *URL;
@property (nonatomic) NSNumber *width;

-(id) initWithDictionary:(NSDictionary *)dictionary;

@end
