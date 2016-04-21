//
//  GeneratedReportViewController.m
//  WHAM
//
//  Created by Pearson White on 4/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "GeneratedReportViewController.h"

@interface GeneratedReportViewController ()

@end

@implementation GeneratedReportViewController

@synthesize generatedType;

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
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = self.title;
    switch (generatedType) {
        case GeneratedPap: {
            // generate pap smear report logic here
            break;
        }
        case GeneratedMammo: {
            // generate mammogram report logic here
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
