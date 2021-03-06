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

// used to set datepicker VC settings
PickViewType pickerToGoTo;
bool showLabelHPV = FALSE;
bool showLabelAbnormalResults = FALSE;
NSString* childViewTitle = @"";



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
	showLabelHPV = FALSE;
}

- (void)viewWillAppear:(BOOL)animated {
    // set dates (note this is fetched here to include popping to this VC as well as pushing it
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    // used to update UI
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm/dd/yyyy"];
    
    // if user has entries in personal history, reflect these prefs
    if(![[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_LAST_MAMMO_DATE]){
        self.lastMammoDate = [defaults valueForKey:KEY_LAST_MAMMO_DATE];
        [self.labelLastMammo setText:[formatter stringFromDate:self.lastMammoDate]];
    } else {
        self.lastMammoDate = nil;
        [self.labelLastMammo setText:@"Not set"];
    }
    // if user has entries in personal history, reflect these prefs
    if(![[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_LAST_PAP_DATE]){
        self.lastPapDate = [defaults valueForKey:KEY_LAST_PAP_DATE];
        [self.labelLastPap setText:[formatter stringFromDate:self.lastPapDate]];
    } else {
        self.lastPapDate = nil;
        [self.labelLastPap setText:@"Not set"];
    }
    // make sure our bar doesn't dissapear on us
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"toUpdateDate"]) {
        // go to picker view and set relavent attributes to show options for pap or mammo
        DatePickerViewController * childViewController = (DatePickerViewController *) [segue destinationViewController];
        childViewController.pickerType = pickerToGoTo;
        childViewController.showLabelHPV = showLabelHPV;
        childViewController.showLabelAbnormal = showLabelAbnormalResults;
        childViewController.title = childViewTitle;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonUpdateLastPapPressed:(id)sender {
    pickerToGoTo = PickExamDatePap;
    showLabelHPV = TRUE;
    showLabelAbnormalResults = TRUE;
    childViewTitle = @"Last Pap Smear";
    [self performSegueWithIdentifier:@"toUpdateDate" sender:self];
}

- (IBAction)buttonUpdateLastMammoPressed:(id)sender {
    pickerToGoTo = PickExamDateMammo;
    showLabelHPV = FALSE;
    showLabelAbnormalResults = TRUE;
    childViewTitle = @"Last Mammogram";
    [self performSegueWithIdentifier:@"toUpdateDate" sender:self];
}




@end
