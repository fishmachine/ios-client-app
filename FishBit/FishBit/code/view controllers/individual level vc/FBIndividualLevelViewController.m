//
//  FBIndividualLevelViewController.m
//  Fishbit
//
//  Created by Nathan Levine on 2/23/14.
//  Copyright (c) 2014 FishBit. All rights reserved.
//

#import "FBIndividualLevelViewController.h"

@interface FBIndividualLevelViewController ()
{
    
    __weak IBOutlet UIWebView *chartWebView;
}

@end

@implementation FBIndividualLevelViewController

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
    chartWebView.backgroundColor = [UIColor redColor];
    
//    NSString *pathOfFile = [[NSBundle mainBundle] pathForResource:@"lineChart" ofType:@"html"];
//    NSString *htmlText = [NSString stringWithContentsOfFile:pathOfFile encoding:NSUTF8StringEncoding error:nil];
//    
//    NSURL *baseURL = [NSURL fileURLWithPath:pathOfFile];
//    
//    [chartWebView loadHTMLString: htmlText baseURL:baseURL];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
