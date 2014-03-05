//
//  FBIndividualLevelViewController.m
//  Fishbit
//
//  Created by Nathan Levine on 2/23/14.
//  Copyright (c) 2014 FishBit. All rights reserved.
//
// Numerics
CGFloat const kJBLineChartViewControllerChartHeight = 250.0f;
CGFloat const kJBLineChartViewControllerChartHeaderHeight = 75.0f;
CGFloat const kJBLineChartViewControllerChartHeaderPadding = 20.0f;
CGFloat const kJBLineChartViewControllerChartFooterHeight = 20.0f;
CGFloat const kJBLineChartViewControllerChartLineWidth = 2.1f;
NSInteger const kJBLineChartViewControllerNumChartPoints = 50;
#import "FBIndividualLevelViewController.h"

// Views
#import "JBLineChartView.h"
#import "JBChartHeaderView.h"
#import "JBLineChartFooterView.h"
#import "JBChartInformationView.h"
#import "ATConstants.h"
#import "ATFishDataObject.h"
#import "UIColor+FBColors.h"

@interface FBIndividualLevelViewController () <JBLineChartViewDelegate, JBLineChartViewDataSource>
{
    NSDateFormatter *df;

    __weak IBOutlet UIWebView *chartWebView;
}

@property (nonatomic, strong) JBLineChartView *lineChartView;
@property (nonatomic, strong) JBChartInformationView *informationView;
@property (nonatomic, strong) NSArray *chartData;

@end

@implementation FBIndividualLevelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

#pragma mark - Data

- (void)initData
{
    self.chartData = [[self.arrayOfData reverseObjectEnumerator] allObjects];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    df = [NSDateFormatter new];
    [df setDateFormat:@"hh:mm a"];
	// Do any additional setup after loading the view.
    [self initData];

    [self setUpChartViews];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.lineChartView setState:JBChartViewStateExpanded animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.lineChartView setState:JBChartViewStateCollapsed];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - line view

- (void)setUpChartViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    //[UIColor colorWithRed:0.0f/255.0f green:169.0f/255.0f blue:216.0f/255.0f alpha:1];
    //self.navigationItem.rightBarButtonItem = [self chartToggleButtonWithTarget:self action:@selector(chartToggleButtonPressed:)];
    
    self.lineChartView = [[JBLineChartView alloc] init];
    self.lineChartView.frame = CGRectMake(kJBNumericDefaultPadding, (kJBNumericDefaultPadding * 2) + self.navigationController.navigationBar.frame.size.height, self.view.bounds.size.width - (kJBNumericDefaultPadding * 2), kJBLineChartViewControllerChartHeight);
    self.lineChartView.delegate = self;
    self.lineChartView.dataSource = self;
    self.lineChartView.headerPadding = kJBLineChartViewControllerChartHeaderPadding;
    self.lineChartView.backgroundColor = [UIColor clearColor];
    
    JBChartHeaderView *headerView = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(kJBNumericDefaultPadding, ceil(self.view.bounds.size.height * 0.5) - ceil(kJBLineChartViewControllerChartHeaderHeight * 0.5), self.view.bounds.size.width - (kJBNumericDefaultPadding * 2), kJBLineChartViewControllerChartHeaderHeight)];
    headerView.titleLabel.text = [self.titleString uppercaseString];
    headerView.titleLabel.textColor = [UIColor FBHealthyBlueColor];
    headerView.titleLabel.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.40];
    headerView.titleLabel.shadowOffset = CGSizeMake(0, 1);
    headerView.subtitleLabel.text = [self.unitString uppercaseString];
    headerView.subtitleLabel.textColor = [UIColor FBHealthyBlueColor];
    headerView.subtitleLabel.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.405];
    headerView.subtitleLabel.shadowOffset = CGSizeMake(0, 1);
    headerView.separatorColor = [UIColor FBHealthyBlueColor];
    self.lineChartView.headerView = headerView;
    
    JBLineChartFooterView *footerView = [[JBLineChartFooterView alloc] initWithFrame:CGRectMake(kJBNumericDefaultPadding, ceil(self.view.bounds.size.height * 0.5) - ceil(kJBLineChartViewControllerChartFooterHeight * 0.5), self.view.bounds.size.width - (kJBNumericDefaultPadding * 2), kJBLineChartViewControllerChartFooterHeight)];
    footerView.backgroundColor = [UIColor clearColor];
    footerView.leftLabel.text = self.leftMostNumberString;
    footerView.leftLabel.textColor = [UIColor FBHealthyBlueColor];
    footerView.rightLabel.text = self.rightMostString;
    footerView.rightLabel.textColor = [UIColor FBHealthyBlueColor];
    footerView.sectionCount = kJBLineChartViewControllerNumChartPoints;
    self.lineChartView.footerView = footerView;
    
    [self.view addSubview:self.lineChartView];
    
    self.informationView = [[JBChartInformationView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x, CGRectGetMaxY(self.lineChartView.frame), self.view.bounds.size.width, self.view.bounds.size.height - CGRectGetMaxY(self.lineChartView.frame) - CGRectGetMaxY(self.navigationController.navigationBar.frame)) layout:JBChartInformationViewLayoutVertical];
    [self.informationView setValueAndUnitTextColor:[UIColor FBHealthyBlueColor]];
    [self.informationView setTitleTextColor:[UIColor FBHealthyBlueColor]];
    [self.informationView setTextShadowColor:nil];
    [self.informationView setSeparatorColor:[UIColor FBHealthyBlueColor]];
    [self.view addSubview:self.informationView];
    
    [self.lineChartView reloadData];

}



#pragma mark - JBLineChartViewDelegate

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView heightForIndex:(NSInteger)index
{
    if ([self.titleString isEqualToString:@"Electrical Conductivity"]) {
        return ((ATFishDataObject*)[self.chartData objectAtIndex:index]).ecLevel;
    } else if ([self.titleString isEqualToString:@"pH"]) {
        return ((ATFishDataObject*)[self.chartData objectAtIndex:index]).pHLevel;
    } else if ([self.titleString isEqualToString:@"Temperature"]) {
        return ((ATFishDataObject*)[self.chartData objectAtIndex:index]).temperatureLevel;
    }
    return 0.0;
}

- (void)lineChartView:(JBLineChartView *)lineChartView didSelectChartAtIndex:(NSInteger)index
{
    [self.informationView setTitleText:[NSString stringWithFormat:@"%@",[df stringFromDate:((ATFishDataObject*)[self.chartData objectAtIndex:index]).created]]];

    
    if ([self.titleString isEqualToString:@"Electrical Conductivity"]) {
        [self.informationView setValueText:[NSString stringWithFormat:@"%.2f",((ATFishDataObject*)[self.chartData objectAtIndex:index]).ecLevel] unitText:@"mS/cm"];
    } else if ([self.titleString isEqualToString:@"pH"]) {
        [self.informationView setValueText:[NSString stringWithFormat:@"%.2f",((ATFishDataObject*)[self.chartData objectAtIndex:index]).pHLevel] unitText:@""];
    } else if ([self.titleString isEqualToString:@"Temperature"]) {
        [self.informationView setValueText:[NSString stringWithFormat:@"%.2f",((ATFishDataObject*)[self.chartData objectAtIndex:index]).temperatureLevel] unitText:@"°F"];
    }
    
    [self.informationView setHidden:NO animated:YES];
}

- (void)lineChartView:(JBLineChartView *)lineChartView didUnselectChartAtIndex:(NSInteger)index
{
    [self.informationView setHidden:YES animated:YES];
}

#pragma mark - JBLineChartViewDataSource

- (NSInteger)numberOfPointsInLineChartView:(JBLineChartView *)lineChartView
{
    return [self.chartData count];
}

- (UIColor *)lineColorForLineChartView:(JBLineChartView *)lineChartView
{
    return [UIColor FBHealthyBlueColor];//kJBColorLineChartLineColor;
}

- (CGFloat)lineWidthForLineChartView:(JBLineChartView *)lineChartView
{
    return kJBLineChartViewControllerChartLineWidth;
}

- (UIColor *)selectionColorForLineChartView:(JBLineChartView *)lineChartView
{
    return [UIColor FBHealthyBlueColor];
}

@end
