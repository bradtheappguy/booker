//
//  RoomRateDetailViewController.m
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "RoomRateDetailViewController.h"
#import "NightlyRate.h"
#import "Surcharge.h"
#import "GTMNSString+HTML.h"
#import "Amenity.h"
#import "BSPersonalInfoViewController.h"

@interface RoomRateDetailViewController ()

@end

@implementation RoomRateDetailViewController

static NSString *html = @"<html><%DESCRIPTION%><br><br><table><%RATE_TABLE%></table><br><br/><h1>Room Description</h1><%ROOM_DESCRIPTION%><h1>Room Amenitites</h1><%ROOM_AMENITIES%></html>";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  RoomRateDetail *roomRateDetail = self.roomRateDetail;
  NSString *description = [roomRateDetail roomDescription];
  
  NSMutableString *rateTable = [[NSMutableString alloc] init];
  
  ChargableRateInfo *charageableRateInfo = [[roomRateDetail rateInfo] charageableRateInfo];
  NSArray *nightlyRates = [charageableRateInfo nightlyRates];
  for (NightlyRate *nightlyRate in nightlyRates) {
    //NSNumber *isPromo = nightlyRate.isPromo;
    NSString *rate = nightlyRate.rate;
    NSString *baseRate = nightlyRate.baseRate;
    NSString *htmlRow = [NSString stringWithFormat:@"<tr><td>%@</td><td>%@</td><td>%@</td></tr>",@"DATE",baseRate,rate];
    [rateTable appendString:htmlRow];
  }
  
  for (Surcharge *surcharge in [charageableRateInfo surcharges]) {
    NSString *htmlRow = [NSString stringWithFormat:@"<tr><td>%@</td><td>%@</td><td>%@</td></tr>",surcharge.type,@"",surcharge.amount];
    [rateTable appendString:htmlRow];
  }

  NSString *total = [charageableRateInfo total];
  NSString *htmlRow = [NSString stringWithFormat:@"<tr><td>%@</td><td>%@</td><td>%@</td></tr>",@"Total",@"",total];
  [rateTable appendString:htmlRow];
  
  
  NSString *htmlToRender = html;
  htmlToRender = [htmlToRender stringByReplacingOccurrencesOfString:@"<%DESCRIPTION%>" withString:description];
  htmlToRender = [htmlToRender stringByReplacingOccurrencesOfString:@"<%RATE_TABLE%>" withString:rateTable];
//  NSString *d = [self.hotelDetail.roomInformation gtm_stringByUnescapingFromHTML];
  NSString *roomDescription = [self.roomType descriptionLong];
  if (!roomDescription) {
    roomDescription = @"";
  }
  
  htmlToRender = [htmlToRender stringByReplacingOccurrencesOfString:@"<%ROOM_DESCRIPTION%>" withString:[roomDescription gtm_stringByUnescapingFromHTML]];

  NSMutableString *amen = [[NSMutableString alloc] initWithString:@"<ul>"];
  for (Amenity *amenity in [self.roomType roomAmenities]) {
    [amen appendFormat:@"<li>%@</li>",amenity.amenity];
  }
  [amen appendString:@"</ul>"];
  
  htmlToRender = [htmlToRender stringByReplacingOccurrencesOfString:@"<%ROOM_AMENITIES%>" withString:amen];
  
  
  [self.webView loadHTMLString:htmlToRender baseURL:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)bookRoomButtonPressed:(id)sender {
  BSPersonalInfoViewController *vc = [[BSPersonalInfoViewController alloc] initWithNibName:nil bundle:nil];
  vc.roomRateDetail = self.roomRateDetail;
  vc.hotelDetail = self.hotelDetail;
  vc.roomType = self.roomType;
  vc.hotelSummary = self.hotelSummary;
  vc.arrivalDate = self.arrivalDate;
  vc.departureDate = self.departureDate;
  
  [self.navigationController pushViewController:vc animated:YES];
}
@end
