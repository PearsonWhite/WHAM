//
//  SettingsViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize buttonResetInformation;

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

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonResetInformationPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"Are you sure? This action cannot be undone." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Clear", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked CLEAR
    if (buttonIndex == 1) {
        [self clearData];
    }
}


- (void)clearData {
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}







@end
