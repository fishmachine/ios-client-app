//
//  FBOverviewVC.m
//  Fishbit
//
//  Created by Nathan Levine on 2/22/14.
//  Copyright (c) 2014 FishBit. All rights reserved.
//
#define FISH_DATA_SECTION 0

#define TEMPERATURE_CELL 0
#define PH_CELL 1
#define SALINITY_CELL 2


#import "FBOverviewVC.h"
#import <Parse/Parse.h>
#import "ATFishDataObject.h"
#import "FBOverviewCells.h"
#import "FBIndividualLevelViewController.h"

@interface FBOverviewVC ()
{
    __weak IBOutlet UILabel *stabilityScoreWordsLabel;
    __weak IBOutlet UILabel *stabilityScoreLabel;
    __weak IBOutlet UILabel *dateLabel;

    __weak IBOutlet UITableView *tableViewOfFishData;
}

@property (nonatomic, strong) NSMutableArray *arrayOfFishDataObjects;


@end

@implementation FBOverviewVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setUpAppearances];
    [self addDummyDataToArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpAppearances
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fishbit-app-logo-v2.png"]];
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    dateLabel.text = [f stringFromDate:[NSDate date]];
}

#pragma mark - Data logic

- (void)addDummyDataToArray
{
    ATFishDataObject *fishObject = [ATFishDataObject new];
    fishObject.temperatureLevel = 72.4;
    fishObject.pHLevel = 8.3;
    fishObject.salinityLevel = 1.026;
    self.arrayOfFishDataObjects = [NSMutableArray new];
    [self.arrayOfFishDataObjects addObject:fishObject];
    
    [tableViewOfFishData reloadData];
    [self adjustStabilityScore];
}

#pragma mark - Tableview Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case FISH_DATA_SECTION:
            return 3;
            break;
            
        default:
            //this should never hit just building this switch in for possible later use
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case FISH_DATA_SECTION: {
            static NSString *cellIdentifier = @"cellIdentifier";
            FBOverviewCells *cell = [tableViewOfFishData dequeueReusableCellWithIdentifier:cellIdentifier];
            ATFishDataObject *fishObject = (ATFishDataObject*)[self.arrayOfFishDataObjects objectAtIndex:0];//indexPath.row];
            
            switch (indexPath.row) {
                case TEMPERATURE_CELL:
                    [cell configureTemperatureCell:fishObject];
                    return cell;
                    break;
                    
                case PH_CELL:
                    [cell configurePHCell:fishObject];
                    return cell;
                    break;
                    
                case SALINITY_CELL:
                    [cell configureSalinityCell:fishObject];
                    return cell;
                    break;
                    
                default:
                    return cell;
                    
                    break;
            }
        }
            break;
            
        default: {
            //this should never hit just building this switch in for possible later use
            static NSString *cellIdentifier = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            return cell;
        }
            
            break;
    }
    return nil;
}

#pragma mark - Tableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - Stability Score

- (CGFloat)calculateStabilityScore:(ATFishDataObject*)fishObject
{
    //arbitrary starting score
    CGFloat score = 9.543;
    
    //algo for calculating score, will change.
    
    //if current levels are good multiply * 1, ok multiply * .85, bad multiply * .5
    if (fishObject.salinityLevel >= 1.024 && fishObject.salinityLevel <= 1.025) {
        score = score * 1;
    } else if (fishObject.salinityLevel >= 1.022 && fishObject.salinityLevel <= 1.02399999) {
        score = score * .85;
    } else if (fishObject.salinityLevel >= 1.02500001 && fishObject.salinityLevel <= 1.0270001) {
        score = score * .85;
    } else if (fishObject.salinityLevel < 1.025 || fishObject.salinityLevel > 1.027) {
        score = score * .7;
    }
    //for pHlevel
    if (fishObject.pHLevel >= 8.0 && fishObject.pHLevel <= 8.4) {
        score = score * 1;
    } else if (fishObject.pHLevel >= 6.9 && fishObject.pHLevel <= 7.9999) {
        score = score * .85;
    } else if (fishObject.pHLevel >= 8.4001 && fishObject.pHLevel <= 8.5) {
        score = score * .85;
    } else if (fishObject.pHLevel < 6.999 || fishObject.pHLevel > 8.50001) {
        score = score * .7;
    }
    
    if (fishObject.temperatureLevel >= 75 && fishObject.temperatureLevel <= 80) {
        score = score * 1;
    } else if (fishObject.temperatureLevel >= 73 && fishObject.temperatureLevel <= 74.999) {
        score = score * .85;
    } else if (fishObject.temperatureLevel >= 80.001 && fishObject.temperatureLevel <= 82) {
        score = score * .85;
    } else if (fishObject.temperatureLevel < 72.99 || fishObject.temperatureLevel >82.0001) {
        score = score * .7;
    }
    
    //if tank has stayed constant for a while multiply by XX >1 amount else multiply by XX amount <1
//    if (fishObject.fluctuationAmount =) {
//        <#statements#>
//    }
    
    return score;
}

- (void)adjustStabilityScore
{
    CGFloat score = [self calculateStabilityScore:(ATFishDataObject*)[self.arrayOfFishDataObjects objectAtIndex:0]];
    stabilityScoreLabel.text = [NSString stringWithFormat:@"%.1f", score];
    
    if (score >= 9) {
        stabilityScoreLabel.textColor = [UIColor greenColor];
    } else if (score >= 7 && score < 9) {
        stabilityScoreLabel.textColor = [UIColor yellowColor];
    } else if (score < 7) {
        stabilityScoreLabel.textColor = [UIColor redColor];
    }
}

#pragma mark - Segues

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *index = [tableViewOfFishData indexPathForSelectedRow];

    if ([segue.identifier isEqualToString:SEGUE_OVERVIEW_TO_GRAPH_VC]) {
        
        FBIndividualLevelViewController *ILVC = [segue destinationViewController];
        
        if (index.row == 0) {
            ILVC.title = @"Temperature";
        } else if (index.row == 1) {
            ILVC.title = @"pH";
        } else if (index.row == 2) {
            ILVC.title = @"Salinity";
        }
    }
}


@end
