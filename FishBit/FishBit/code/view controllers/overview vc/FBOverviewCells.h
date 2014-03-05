//
//  FBOverviewCells.h
//  Fishbit
//
//  Created by Nathan Levine on 2/23/14.
//  Copyright (c) 2014 FishBit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATFishDataObject.h"

@interface FBOverviewCells : UITableViewCell
{
    
}
@property (strong, nonatomic) IBOutlet UILabel *cellScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellUnitLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellDetailLabel;
@property (strong, nonatomic) IBOutlet UIImageView *cellImageView;

- (void)configurePHCell:(ATFishDataObject *)fishObject;
- (void)configureTemperatureCell:(ATFishDataObject *)fishObject;
- (void)configureECCell:(ATFishDataObject *)fishObject;



@end
