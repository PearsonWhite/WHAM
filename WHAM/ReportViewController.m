//
//  SecondViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "ReportViewController.h"
#import "GeneratedReportViewController.h"
#import "constants.h"

@interface ReportViewController ()

@end

@implementation ReportViewController

GeneratedType generatetedType;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITabBarItem *item0 = [self.tabBarController.tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [self.tabBarController.tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [self.tabBarController.tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [self.tabBarController.tabBar.items objectAtIndex:3];


    [item0 setImage:[[UIImage imageNamed:@"reports.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [item1 setImage:[[UIImage imageNamed:@"information.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [item2 setImage:[[UIImage imageNamed:@"upcoming.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    [item3 setImage:[[UIImage imageNamed:@"settings.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    // self.tabBarController.tabBar.barTintColor = [UIColor clearColor];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    // [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];



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
    
    // make sure we have all the data
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSArray* neededKeys = [[NSArray alloc] initWithObjects:
                           KEY_HPV_VACCINATED,
                           KEY_HAD_HISTERECTOMY,
                           KEY_FAMILY_HISTORY_CANCER,
                           KEY_SMOKES,
                           KEY_BIRTH_DATE,
                           KEY_LAST_MAMMO_DATE,
                           KEY_LAST_PAP_DATE,
                           KEY_ABNORMAL_RESULTS_MAMMO,
                           KEY_ABNORMAL_RESULTS_PAP,
                           KEY_HPV_TESTED,
                           nil];
    
    [self.labelNotEnoughInfo setHidden:TRUE];
    for (NSString* key in neededKeys) {
        if (![[[defaults dictionaryRepresentation] allKeys] containsObject:key]) {
            [self.buttonGenerateMammo setHidden:TRUE];
            [self.buttonGeneratePap setHidden:TRUE];
            [self.buttonLinks setHidden:TRUE];
            [self.labelNotEnoughInfo setHidden:FALSE];
            break;
        }
    }
    
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
