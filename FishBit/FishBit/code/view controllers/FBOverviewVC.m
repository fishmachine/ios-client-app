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
    fishObject.salinityLevel = 1.024;
    self.arrayOfFishDataObjects = [NSMutableArray new];
    [self.arrayOfFishDataObjects addObject:fishObject];
    
    [tableViewOfFishData reloadData];
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


@end
