//
//  LastProceduresViewController.m
//  WHAM
//
//  Created by Pearson White on 3/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "LastProceduresViewController.h"
#import "DatePickerViewController.h"
#include "constants.h"

@interface LastProceduresViewController ()

@end

@implementation LastProceduresViewController

@synthesize labelLastMammo, labelLastPap;

PickViewType pickerToGoTo;



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
    // set dates (note this is fetched here to include popping to this VC as well as pushing it
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    // used to update UI
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm/dd/yyyy"];
    
    if(![[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_LAST_MAMMO_DATE]){
        self.lastMammoDate = [defaults valueForKey:KEY_LAST_MAMMO_DATE];
        [self.labelLastMammo setText:[formatter stringFromDate:self.lastMammoDate]];
    } else {
        self.lastMammoDate = nil;
        [self.labelLastMammo setText:@"Not set"];
    }
    
    if(![[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_LAST_PAP_DATE]){
        self.lastPapDate = [defaults valueForKey:KEY_LAST_PAP_DATE];
        [self.labelLastPap setText:[formatter stringFromDate:self.lastPapDate]];
    } else {
        self.lastPapDate = nil;
        [self.labelLastPap setText:@"Not set"];
    }
    
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"toUpdateDate"]) {
        DatePickerViewController * childViewController = (DatePickerViewController *) [segue destinationViewController];
        childViewController.pickerType = pickerToGoTo;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonUpdateLastPapPressed:(id)sender {
    pickerToGoTo = PickExamDatePap;
    [self performSegueWithIdentifier:@"toUpdateDate" sender:self];
}

- (IBAction)buttonUpdateLastMammoPressed:(id)sender {
    pickerToGoTo = PickExamDateMammo;
    [self performSegueWithIdentifier:@"toUpdateDate" sender:self];
}




@end
