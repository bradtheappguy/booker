//
//  RoomRateDetailViewController.h
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomRateDetail.h"
#import "HotelDetail.h"
#import "RoomType.h"
#import "HotelSummarie.h"

@interface RoomRateDetailViewController : UIViewController
@property (nonatomic) NSString *arrivalDate;
@property (nonatomic) NSString *departureDate;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) HotelSummarie *hotelSummary;
@property (nonatomic) RoomRateDetail *roomRateDetail;
@property (nonatomic) HotelDetail *hotelDetail;
@property (nonatomic) RoomType *roomType;

-(IBAction)bookRoomButtonPressed:(id)sender;

@end
