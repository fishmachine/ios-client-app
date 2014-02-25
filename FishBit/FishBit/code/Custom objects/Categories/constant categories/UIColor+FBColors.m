//
//  UIColor+FBColors.m
//  Fishbit
//
//  Created by Nathan Levine on 2/24/14.
//  Copyright (c) 2014 FishBit. All rights reserved.
//

#import "UIColor+FBColors.h"

@implementation UIColor (FBColors)

#pragma mark - theme colors

+ (UIColor*) FBHealthyBlueColor
{
    return [UIColor colorWithRed:0.0f/255.0f green:169.0f/255.0f blue:216.0f/255.0f alpha:1];
}

+ (UIColor*) FBMildlyHealthyGreenColor
{
    return [UIColor colorWithRed:2.0f/255.0f green:171.0f/255.0f blue:139.0f/255.0f alpha:1];
}

+ (UIColor*) FBUnHealthyGreenColor
{
    return [UIColor colorWithRed:137.0f/255.0f green:197.0f/255.0f blue:34.0f/255.0f alpha:1];
}

+ (UIColor*) FBGrey
{
    return [UIColor colorWithRed:150.0f/255.0f green:152.0f/255.0f blue:156.0f/255.0f alpha:1];
}

@end
