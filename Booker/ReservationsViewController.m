//
//  ReservationsViewController.m
//  Booker
//
//  Created by JinNan on 5/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "ReservationsViewController.h"
#import "ReservationCell.h"
#import "LocalDataModel.h"
#import "ReservationDetailViewController.h"

@interface ReservationsViewController ()

@end

@implementation ReservationsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];
        self.tabBarItem.title = @"Reservation";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ReservationCell" bundle:nil] forCellReuseIdentifier:@"ReservationCell"];
    [self.tableView setRowHeight:100.0f];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    
    self.navigationController.navigationBar.hidden = NO;
    self.title = [NSString stringWithFormat:@"%d results",[[LocalDataModel sharedLocalData] reservationArray].count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[LocalDataModel sharedLocalData] reservationArray].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ReservationCell";
    ReservationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (ReservationCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *hotelInfoDic = (NSDictionary *)[[[LocalDataModel sharedLocalData] reservationArray] objectAtIndex:indexPath.row];
    
    cell.checkinDateLabel.text = [hotelInfoDic objectForKey:@"arrivalDate"];
    cell.checkoutDateLabel.text = [hotelInfoDic objectForKey:@"departureDate"];
    cell.hotelNameLabel.text = [hotelInfoDic objectForKey:@"hotelName"];
    cell.cityLabel.text = [hotelInfoDic objectForKey:@"hotelCity"];
    
    [cell.hotelNameLabel sizeToFit];

    return cell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ReservationDetailViewController *detailViewController = [[ReservationDetailViewController alloc] initWithNibName:@"ReservationDetailViewController" bundle:nil];

    detailViewController.nIndex = indexPath.row;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
