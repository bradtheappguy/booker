//
//  HotelDetailViewController.m
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelDetailViewController.h"
#import "ChargableRateInfo.h"
#import "HotelHeaderView.h"
#import "RoomRateCell.h"
#import "RoomRateDetailViewController.h"
#import "ExpediaAPIClient.h"
#import "RoomType.h"

@interface HotelDetailViewController () {
  HotelHeaderView *header;
}

@end

@implementation HotelDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  header = [[[NSBundle mainBundle] loadNibNamed:@"HotelHeaderView" owner:nil options:nil] objectAtIndex:0];
  
  [self.tableView registerNib:[UINib nibWithNibName:@"RoomRateCell" bundle:nil] forCellReuseIdentifier:@"RoomRateCell"];
  self.tableView.rowHeight = 176;
}

- (void) viewWillAppear:(BOOL)animated {
  [header setHotel:self.hotelSummary];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  if  (section == 0) {
    return header;
  }
  return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  if  (section == 0) {
    return header.bounds.size.height;
  }
  return 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.hotelSummary roomRateDetails] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RoomRateCell";
    RoomRateCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (RoomRateCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }

    RoomRateDetail *roomRateDetail = [[self.hotelSummary roomRateDetails] objectAtIndex:indexPath.row];
//    RateInfo *rateInfo = [roomRateDetail rateInfo];
//    ChargableRateInfo *chargableRateInfo =  [rateInfo charageableRateInfo];
  [cell setRoomRateDetails:roomRateDetail];
  
  
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  RoomRateDetail *roomRateDetail = [[self.hotelSummary roomRateDetails] objectAtIndex:indexPath.row];
  NSUInteger roomRatecode = [[roomRateDetail roomTypeCode] integerValue];
  
  
  
  RoomRateDetailViewController *vc = [[RoomRateDetailViewController alloc] initWithNibName:nil bundle:nil];
  [vc setRoomRateDetail:roomRateDetail];
  [vc setHotelDetail:self.hotelDetails];
  [vc setHotelSummary:self.hotelSummary];
  vc.arrivalDate = self.arrivalDate;
  vc.departureDate = self.departureDate;
  
  RoomType *roomType = nil;
  for (RoomType *r in self.roomTypes) {
    if (roomRatecode == [[r roomCode] integerValue]) {
      roomType = r;
    }
  }
  
  [vc setRoomType:roomType];
  [self.navigationController pushViewController:vc animated:YES];
}


-(void) setHotelSummary:(HotelSummarie *)hotelSummary {
  _hotelSummary = hotelSummary;
  NSString *hotelId = [hotelSummary.hotelId stringValue];
  [[ExpediaAPIClient sharedClient] performHotelInfoWithParamaters:@{@"hotelId": hotelId}
                                                          success:^(HotelInformationResponse  *response) {
                                                            NSLog(@"%@",response);
                                                            self.propertyAmenities = [response propertyAmenities];
                                                            self.hotelImages = [response hotelImages];
                                                            self.roomTypes = [response roomTypes];
                                                            self.hotelDetails = [response hotelDetails];
                                                            self.suppliers = [response suppliers];
                                                            self.hotelId = [response hotelId];
                                                            NSLog(@"Details Loaded");
                                                            /*[[ExpediaAPIClient sharedClient] performRoomAvailabilityWithParamaters:
                                                              @{@"hotelID": self.hotelId,
                                                                @"arrivalDate": self.arrivalDate,
                                                                @"departureDate": self.departureDate
                                                             } success:nil failure:nil];*/
                                                          }
                                                          failure:^(NSError *error){
                                                            NSLog(@"%@",[error localizedDescription]);
                                                          }];
}
@end
