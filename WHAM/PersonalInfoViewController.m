//
//  PersonalInfoViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "DatePickerViewController.h"
#import "constants.h"

@interface PersonalInfoViewController ()

@end


@implementation PersonalInfoViewController

NSNumber* doesSmoke = nil;


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
    
}

- (void)viewWillAppear:(BOOL)animated {
    //self.navigationController.navigationBarHidden = true;
    
    // set check buttons (smoke)
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    if(![[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_SMOKES]){
        doesSmoke = [defaults valueForKey:KEY_SMOKES];
        if ([doesSmoke boolValue]) {
            [self.buttonSmokeNo setSelected:TRUE];
        } else {
            [self.buttonSmokeNo setSelected:FALSE];
        }
    } else {
        [self.buttonSmokeNo setSelected:FALSE];
        [self.buttonSmokeYes setSelected:FALSE];
    }
    
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
    [super viewWillAppear:animated];
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"toUpdateDate"]) {
        DatePickerViewController * childViewController = (DatePickerViewController *) [segue destinationViewController];
        
        childViewController.pickerType = PickExamDateBDay;
    }
    //[self.navigationController setNavigationBarHidden:FALSE];
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationItem setHidesBackButton:FALSE];
}

- (IBAction)buttonSavePressed:(id)sender {
    // update saved values
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject:doesSmoke forKey:KEY_SMOKES];
}

- (IBAction)buttonEnterBirthdayPressed:(id)sender {
    [self performSegueWithIdentifier:@"toUpdateDate" sender:self];
}

- (IBAction)buttonLastProceduresPressed:(id)sender {
    [self performSegueWithIdentifier:@"toLastProcedures" sender:self];
}

- (IBAction)buttonPastMedHistoryPressed:(id)sender {
    [self performSegueWithIdentifier:@"toMedHistory" sender:self];
}

- (IBAction)buttonFamilyHistoryPressed:(id)sender {
    [self performSegueWithIdentifier:@"toFamilyHistory" sender:self];
}

- (IBAction)buttonSmokeYesPressed:(id)sender {
    // update local bool
    doesSmoke = [NSNumber numberWithBool:TRUE];
    
    // update buttons
    [self.buttonSmokeYes setSelected:TRUE];
    [self.buttonSmokeNo setSelected:FALSE];
}

- (IBAction)buttonSmokeNoPressed:(id)sender {
    // update local bool
    doesSmoke = [NSNumber numberWithBool:FALSE];
    
    // update buttons
    [self.buttonSmokeYes setSelected:FALSE];
    [self.buttonSmokeNo setSelected:TRUE];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
