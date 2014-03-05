//
//  ATConstants.h
//  Atron10k
//
//  Created by Nathan Levine on 2/8/14.
//  Copyright (c) 2014 Atron10k. All rights reserved.
//

#ifndef Atron10k_ATConstants_h
#define Atron10k_ATConstants_h

/*DATA CELLS*/
#define FISH_DATA_TEMPERATURE_CELL @"temperatureCell"
#define FISH_DATA_PH_CELL @"pHCell"
#define FISH_DATA_AMMONIA_CELL @"AmmoniaCell"
#define FISH_DATA_NITRITE_CELL @"nitriteCell"
#define FISH_DATA_NITRATE_CELL @"nitrateCell"
#define FISH_DATA_SALINITY_CELL @"salinityCell"
#define FISH_DATA_PHOSPHATES_CELL @"phosphatesCell"


/*SEGUES*/
#define SEGUE_OVERVIEW_TO_GRAPH_VC @"cellToGraphVC"



//jawbone constants
#pragma mark - Footers

#define kJBFontFooterLabel [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0]
#define kJBFontFooterSubLabel [UIFont fontWithName:@"HelveticaNeue" size:10.0]

#pragma mark - Headers

#define kJBFontHeaderTitle [UIFont fontWithName:@"HelveticaNeue-Bold" size:24]
#define kJBFontHeaderSubtitle [UIFont fontWithName:@"HelveticaNeue-Light" size:14]

#pragma mark - Information

#define kJBFontInformationTitle [UIFont fontWithName:@"HelveticaNeue" size:20]
#define kJBFontInformationValue [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:100]
#define kJBFontInformationUnit [UIFont fontWithName:@"HelveticaNeue" size:60]

#define UIColorFromHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

#pragma mark - Navigation

#define kJBColorNavigationBarTint UIColorFromHex(0xFFFFFF)
#define kJBColorNavigationTint UIColorFromHex(0x000000)

#pragma mark - Bar Chart

#define kJBColorBarChartControllerBackground UIColorFromHex(0x313131)
#define kJBColorBarChartBackground UIColorFromHex(0x3c3c3c)
#define kJBColorBarChartBarBlue UIColorFromHex(0x08bcef)
#define kJBColorBarChartBarGreen UIColorFromHex(0x34b234)
#define kJBColorBarChartHeaderSeparatorColor UIColorFromHex(0x686868)

#pragma mark - Line Char

#define kJBColorLineChartControllerBackground UIColorFromHex(0xb7e3e4)
#define kJBColorLineChartBackground UIColorFromHex(0xb7e3e4)
#define kJBColorLineChartHeader UIColorFromHex(0x1c474e)
#define kJBColorLineChartHeaderSeparatorColor UIColorFromHex(0x8eb6b7)
#define kJBColorLineChartLineColor [UIColor colorWithWhite:1.0 alpha:0.5]

#define localize(key, default) NSLocalizedStringWithDefaultValue(key, nil, [NSBundle mainBundle], default, nil)

#pragma mark - Labels

#define kJBStringLabel1987 localize(@"label.1985", @"1987")
#define kJBStringLabel2013 localize(@"label.2013", @"2013")
#define kJBStringLabeJanuary localize(@"label.january", @"January")
#define kJBStringLabelDecember localize(@"label.august", @"December")
#define kJBStringLabelAverageMonthlyRainfall localize(@"label.annual.monthly.rainfall", @"Average Monthly Rainfall")
#define kJBStringLabelAverageAnnualRainfall localize(@"label.average.annual.rainfall", @"Average Annual Rainfall")
#define kJBStringLabelSanFrancisco localize(@"label.san.francisco", @"San Francisco")
#define kJBStringLabelMm localize(@"label.mm", @"mm")

#define kJBNumericDefaultPadding 10.0f
#define kJBNumericDefaultAnimationDuration 0.25f

#endif
