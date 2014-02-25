//
//  FBOverviewCells.m
//  Fishbit
//
//  Created by Nathan Levine on 2/23/14.
//  Copyright (c) 2014 FishBit. All rights reserved.
//

#import "FBOverviewCells.h"
#import "UIColor+FBColors.h"

@implementation FBOverviewCells
{
    __weak IBOutlet UIImageView *cellImageView;
    __weak IBOutlet UILabel *cellDetailLabel;
    __weak IBOutlet UILabel *cellScoreLabel;
    
    __weak IBOutlet UILabel *cellUnitLabel;
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
    cellUnitLabel.text = @"";
    cellUnitLabel.textColor = [UIColor FBGrey];

    
    if (fishObject.pHLevel >= 8.0 && fishObject.pHLevel <= 8.4) {
        cellImageView.image = [UIImage imageNamed:@"happyFace.png"];
        cellDetailLabel.textColor = [UIColor FBHealthyBlueColor];
        cellScoreLabel.textColor = [UIColor FBHealthyBlueColor];
    } else if (fishObject.pHLevel >= 6.9 && fishObject.pHLevel <= 7.9999) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
        cellDetailLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
    } else if (fishObject.pHLevel >= 8.4001 && fishObject.pHLevel <= 8.5) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
        cellDetailLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
    } else if (fishObject.pHLevel < 6.999 || fishObject.pHLevel > 8.50001) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
        cellDetailLabel.textColor = [UIColor FBUnHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBUnHealthyGreenColor];
    }

    
}

- (void)configureTemperatureCell:(ATFishDataObject *)fishObject
{
    cellScoreLabel.text = [NSString stringWithFormat:@"%.2f", [self getFahrenheitFromCelsius:fishObject.temperatureLevel]];
    cellDetailLabel.text = @"Temperature";
    cellUnitLabel.text = @"°F";
    cellUnitLabel.textColor = [UIColor FBGrey];
    
    
    if (fishObject.temperatureLevel >= 75 && fishObject.temperatureLevel <= 80) {
        cellImageView.image = [UIImage imageNamed:@"happyFace.png"];
        cellDetailLabel.textColor = [UIColor FBHealthyBlueColor];
        cellScoreLabel.textColor = [UIColor FBHealthyBlueColor];
    } else if (fishObject.temperatureLevel >= 73 && fishObject.temperatureLevel <= 74.999) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
        cellDetailLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
    } else if (fishObject.temperatureLevel >= 80.001 && fishObject.temperatureLevel <= 82) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
        cellDetailLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
    } else if (fishObject.temperatureLevel < 72.99 || fishObject.temperatureLevel >82.0001) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
        cellDetailLabel.textColor = [UIColor FBUnHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBUnHealthyGreenColor];
    }

}

- (void)configureECCell:(ATFishDataObject *)fishObject
{
    cellScoreLabel.text = [NSString stringWithFormat:@"%.2f", fishObject.ecLevel];
    cellDetailLabel.text = @"Electrical Current";
    cellUnitLabel.text = @"mS/cm";
    cellUnitLabel.textColor = [UIColor FBGrey];

    
    if (fishObject.ecLevel >= 51.7 && fishObject.ecLevel <= 54.4) {
        cellImageView.image = [UIImage imageNamed:@"happyFace.png"];
        cellDetailLabel.textColor = [UIColor FBHealthyBlueColor];
        cellScoreLabel.textColor = [UIColor FBHealthyBlueColor];
    } else if (fishObject.ecLevel >= 48.6 && fishObject.ecLevel < 51.7) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
        cellDetailLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
    } else if (fishObject.ecLevel > 54.4 && fishObject.ecLevel <= 56.5) {
        cellImageView.image = [UIImage imageNamed:@"neutral.png"];
        cellDetailLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBMildlyHealthyGreenColor];
    } else if (fishObject.ecLevel < 48.6 || fishObject.ecLevel > 56.5) {
        cellImageView.image = [UIImage imageNamed:@"sadFace.png"];
        cellDetailLabel.textColor = [UIColor FBUnHealthyGreenColor];
        cellScoreLabel.textColor = [UIColor FBUnHealthyGreenColor];
    }

}

#pragma mark - logic

- (void)convertElectricalConductivtyIntoSpecificGravity
{
    //nope
}

- (CGFloat)getFahrenheitFromCelsius:(CGFloat)celsius
{
    return (((celsius * 9) / 5) + 32);
}

@end
