//
//  HotelListViewController.h
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelListViewController : UITableViewController

@property (nonatomic) NSString *arrivalDate;
@property (nonatomic) NSString *departureDate;

@property (nonatomic) NSArray *hotels;

@end
