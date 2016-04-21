//
//  SecondViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "ReportViewController.h"
#import "GeneratedReportViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController

GeneratedType generatetedType;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = self.title;
    [self.navigationController setNavigationBarHidden:FALSE];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString* segueName = segue.identifier;
    if ([segueName isEqualToString:@"toGeneratedReportsController"]) {
        GeneratedReportViewController* childVC = (GeneratedReportViewController *) [segue destinationViewController];
        [childVC setGeneratedType:generatetedType];
    }
}


- (IBAction)buttonGeneratePapSmearReportPressed:(id)sender {
    generatetedType = GeneratedPap;
    [self performSegueWithIdentifier:@"toGeneratedReportsController" sender:self];
}

- (IBAction)buttonGenerateMammogramReportPressed:(id)sender {
    generatetedType = GeneratedMammo;
    [self performSegueWithIdentifier:@"toGeneratedReportsController" sender:self];
}

- (IBAction)buttonSuggestedLinkesPressed:(id)sender {
    [self performSegueWithIdentifier:@"toSuggestedLinksViewController" sender:self];
}

@end
