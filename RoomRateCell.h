//
//  RoomRateCell.h
//  Booker
//
//  Created by Brad Smith on 4/6/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomRateDetail.h"

@interface RoomRateCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *roomDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *line1;
@property (weak, nonatomic) IBOutlet UILabel *line2;
@property (weak, nonatomic) IBOutlet UILabel *line3;
@property (weak, nonatomic) IBOutlet UILabel *line4;
@property (weak, nonatomic) IBOutlet UILabel *line5;

-(void) setRoomRateDetails:(RoomRateDetail *)roomRateDetail;

@end
