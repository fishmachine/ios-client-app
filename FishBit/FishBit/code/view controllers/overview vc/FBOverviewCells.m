//
//  FBOverviewCells.m
//  Fishbit
//
//  Created by Nathan Levine on 2/23/14.
//  Copyright (c) 2014 FishBit. All rights reserved.
//

#import "FBOverviewCells.h"

@implementation FBOverviewCells
{
    __weak IBOutlet UIImageView *cellImageView;
    __weak IBOutlet UILabel *cellDetailLabel;
    __weak IBOutlet UILabel *cellScoreLabel;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configurePHCell:(ATFishDataObject *)fishObject
{
    cellScoreLabel.text = [NSString stringWithFormat:@"%.2f", fishObject.pHLevel];
    cellDetailLabel.text = @"pH";
    
    if (fishObject.pHLevel >= 8.0 && fishObject.pHLevel <= 8.4) {
        cellImageView.image = [UIImage imageNamed:@"happyFace.png"];
    } else if (fishObject.pHLevel >= 7.9 && fishObject.pHLevel <= 7.9999) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
    } else if (fishObject.pHLevel >= 8.4001 && fishObject.pHLevel <= 8.5) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
    } else if (fishObject.pHLevel < 6.999) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
    } else if (fishObject.pHLevel > 8.50001) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
    }
}

- (void)configureTemperatureCell:(ATFishDataObject *)fishObject
{
    cellScoreLabel.text = [NSString stringWithFormat:@"%.2f", fishObject.temperatureLevel];
    cellDetailLabel.text = @"Temperature";
    
    
    if (fishObject.temperatureLevel >= 75 && fishObject.temperatureLevel <= 80) {
        cellImageView.image = [UIImage imageNamed:@"happyFace.png"];
    } else if (fishObject.temperatureLevel >= 73 && fishObject.temperatureLevel <= 74.999) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
    } else if (fishObject.temperatureLevel >= 80.001 && fishObject.temperatureLevel <= 82) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
    } else if (fishObject.temperatureLevel < 72.99) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
    } else if (fishObject.temperatureLevel >82.0001) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
    }


}

- (void)configureSalinityCell:(ATFishDataObject *)fishObject
{
    cellScoreLabel.text = [NSString stringWithFormat:@"%.4f", fishObject.salinityLevel];
    cellDetailLabel.text = @"Salinity";
    
    if (fishObject.salinityLevel >= 1.024 && fishObject.salinityLevel <= 1.025) {
        cellImageView.image = [UIImage imageNamed:@"happyFace.png"];
    } else if (fishObject.salinityLevel >= 1.022 && fishObject.salinityLevel <= 1.02399999) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
    } else if (fishObject.salinityLevel >= 1.02500001 && fishObject.salinityLevel <= 1.0270001) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
    } else if (fishObject.salinityLevel < 1.025) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
    } else if (fishObject.salinityLevel > 1.027) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
    }

}

@end
