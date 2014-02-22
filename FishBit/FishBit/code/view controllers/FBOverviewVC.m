//
//  FBOverviewVC.m
//  Fishbit
//
//  Created by Nathan Levine on 2/22/14.
//  Copyright (c) 2014 FishBit. All rights reserved.
//

#import "FBOverviewVC.h"
#import <Parse/Parse.h>

@interface FBOverviewVC ()

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
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
