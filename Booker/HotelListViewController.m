//
//  HotelListViewController.m
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelListViewController.h"
#import "HotelSummarie.h"
#import "HotelDetailViewController.h"
#import "HotelCell.h"
#import "ExpediaAPIClient.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface HotelListViewController () {

}

@end

@implementation HotelListViewController

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
  [self.tableView registerNib:[UINib nibWithNibName:@"HotelCell" bundle:nil] forCellReuseIdentifier:@"HotelCell"];
  [self.tableView setRowHeight:100.0f];
  
  

  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
  self.title = [NSString stringWithFormat:@"%d results",self.hotels.count];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hotels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HotelCell";
    HotelCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (HotelCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
  
  HotelSummarie *summary = (HotelSummarie *)[self.hotels objectAtIndex:indexPath.row];
  
  //Tumbnail
  NSString *urlString = [NSString stringWithFormat:@"http://images.travelnow.com/%@",[summary thumbNailUrl]];
  urlString = [urlString stringByReplacingOccurrencesOfString:@"_t." withString:@"_b."];
  [cell.thumbnailView setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:nil];
  
  //Name
  cell.hotelNameLabel.text = [summary name];
  
  //Price
  cell.priceLabel.text = [NSString stringWithFormat:@"From\n%@",[summary lowRate]];
  
  //Location
  cell.cityAndZipLabel.text = [NSString stringWithFormat:@"%@, %@",summary.city,summary.postalCode];
  
  
  cell.locationDescriptionLabel.text = [summary locationDescription];
  //Stars and Reviews
  NSNumber *rating = [summary hotelRating];
  NSNumber *ttripAdvisorRating = [summary tripAdvisorRating];
  cell.starsAndReviewsLabel.text = [NSString stringWithFormat:@"%d stars (%d trip advisor)",[rating integerValue],[ttripAdvisorRating integerValue]];
  
  return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  HotelDetailViewController *detailViewController = [[HotelDetailViewController alloc] initWithNibName:nil bundle:nil];
  detailViewController.arrivalDate = self.arrivalDate;
  detailViewController.departureDate = self.departureDate;
  detailViewController.hotelSummary = [self.hotels objectAtIndex:indexPath.row];
  [self.navigationController pushViewController:detailViewController animated:YES];
  


}

@end
