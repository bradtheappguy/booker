//
//  HotelDetailViewController.h
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelSummarie.h"
#import "RoomRateDetail.h"

@interface HotelDetailViewController : UITableViewController

@property (nonatomic) HotelSummarie *hotelSummary;

@property (nonatomic) NSString *arrivalDate;
@property (nonatomic) NSString *departureDate;

@property (nonatomic) NSMutableArray *propertyAmenities; //Strings
@property (nonatomic) NSMutableArray *hotelImages; //Strings
@property (nonatomic) NSMutableArray *roomTypes; // RoomType
@property (nonatomic) HotelDetail *hotelDetails;
@property (nonatomic) NSMutableArray *suppliers;
@property (nonatomic) NSString *hotelId;

@end
