//
//  DatePickerViewController.m
//  WHAM
//
//  Created by Pearson White on 3/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "DatePickerViewController.h"
#import "constants.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

@synthesize pickerType;
@synthesize datePicker;
@synthesize showLabelHPV, showLabelAbnormal;


NSString* keyForDefaults;


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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    
    
    
    
    [self.buttonHPVno setBackgroundImage:[UIImage imageNamed:@"emptyBox.png"]
                                    forState:UIControlStateNormal];
    [self.buttonHPVyes setBackgroundImage:[UIImage imageNamed:@"emptyBox.png"]
                                forState:UIControlStateNormal];
    [self.buttonHPVno setBackgroundImage:[UIImage imageNamed:@"checkedBox.png"]
                                 forState:UIControlStateSelected];
    [self.buttonHPVyes setBackgroundImage:[UIImage imageNamed:@"checkedBox.png"]
                          forState:UIControlStateSelected];
    [self.buttonResultsAbnormalNo setBackgroundImage:[UIImage imageNamed:@"emptyBox.png"]
                      forState:UIControlStateNormal];
    [self.buttonResultsAbnormalNo setBackgroundImage:[UIImage imageNamed:@"checkedBox.png"]
                                            forState:UIControlStateSelected];
    [self.buttonResultsAbnormalYes setBackgroundImage:[UIImage imageNamed:@"checkedBox.png"]
                      forState:UIControlStateSelected];
    [self.buttonResultsAbnormalYes setBackgroundImage:[UIImage imageNamed:@"emptyBox.png"]
                                            forState:UIControlStateNormal];
    
    
    
    //NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    //NSDate* defaultDate;
    switch (self.pickerType) {
        case PickExamDateBDay: {
            keyForDefaults = KEY_BIRTH_DATE;
            break;
        } case PickExamDateMammo: {
            keyForDefaults = KEY_LAST_MAMMO_DATE;
            break;
        } case PickExamDatePap: {
            keyForDefaults = KEY_LAST_PAP_DATE;
            break;
        }
            
        default:
            break;
    }
    
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
    
    
    
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    
    
    
    [self.labelTestedForHPV setHidden:!showLabelHPV];
    [self.labelTestedForHPVyes setHidden:!showLabelHPV];
    [self.labelTestedForHPVno setHidden:!showLabelHPV];
    [self.buttonHPVno setHidden:!showLabelHPV];
    [self.buttonHPVyes setHidden:!showLabelHPV];
    
    [self.labelResultsAbnormal setHidden:!showLabelAbnormal];
    [self.labelResultsAbnormalYes setHidden:!showLabelAbnormal];
    [self.labelResultsAbnormalNo setHidden:!showLabelAbnormal];
    [self.buttonResultsAbnormalNo setHidden:!showLabelAbnormal];
    [self.buttonResultsAbnormalYes setHidden:!showLabelAbnormal];
    
    UIBarButtonItem *buttonSave = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                           style:UIBarButtonItemStyleDone
                                                           target:self
                                                           action:@selector(buttonSavePressed:)];
    self.navigationItem.rightBarButtonItem = buttonSave;
    
    [self loadSavedAnswers];
    
    [super viewWillAppear:animated];
    
}

- (void)loadSavedAnswers {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    if (showLabelAbnormal) {
        if (self.pickerType == PickExamDateMammo) {
            [self.buttonResultsAbnormalYes setSelected:[[defaults objectForKey:KEY_ABNORMAL_RESULTS_MAMMO] boolValue]];
            [self.buttonResultsAbnormalNo setSelected:![[defaults objectForKey:KEY_ABNORMAL_RESULTS_MAMMO] boolValue]];
        } else {
            [self.buttonResultsAbnormalYes setSelected:[[defaults objectForKey:KEY_ABNORMAL_RESULTS_PAP] boolValue]];
            [self.buttonResultsAbnormalNo setSelected:![[defaults objectForKey:KEY_ABNORMAL_RESULTS_PAP] boolValue]];
        }
        
    }
    
    if (showLabelHPV) {
        [self.buttonHPVyes setSelected:[[defaults objectForKey:KEY_HPV_TESTED] boolValue]];
        [self.buttonHPVno setSelected:![[defaults objectForKey:KEY_HPV_TESTED] boolValue]];
    }
    
    // load date
    // check for saved key and update datePicker accordingly
    if ([[[defaults dictionaryRepresentation] allKeys] containsObject:keyForDefaults]) {
        [self.datePicker setDate:[defaults objectForKey:keyForDefaults]];
    } else {
        #warning unfinished implementation
        // here we need to find an appropriate date to have as the default
    }
    
}

typedef enum VALIDATE_RETURN { RETURN_VALID = 0, RETURN_DATE_INCORRECT, RETURN_DATE_TOO_YOUNG, RETURN_QUESTION_UNANSWERED, RETURN_LAST } VALIDATE_RETURN;
- (VALIDATE_RETURN)validateInformation {
    #warning unfinished implementation
    
    switch (self.pickerType) {
        case PickExamDateBDay: {
            NSTimeInterval timeSinceBDay = [[NSDate date] timeIntervalSinceDate:self.datePicker.date];
            double age = timeSinceBDay/(360.0*24.0*60.0*60.0);
            NSLog(@"age: %f", age);
            if (age < 21.0) {
                
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Age too small" message:@"You must be 21 or older to use this app." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
                
                return RETURN_DATE_TOO_YOUNG;
            }
            break;
        } case PickExamDateMammo: {
            if (!(self.buttonHPVyes.isSelected || self.buttonHPVno.isSelected)) {
                
                
            }
            break;
        } case PickExamDatePap: {
            
            break;
        }
            
        default:
            break;
    }
    
    return RETURN_VALID;
}

- (IBAction)buttonAbnormalYesPressed:(id)sender {
    [self.buttonResultsAbnormalNo setSelected:FALSE];
    [self.buttonResultsAbnormalYes setSelected:TRUE];
}


- (IBAction)buttonAbnormalNoPressed:(id)sender {
    [self.buttonResultsAbnormalNo setSelected:TRUE];
    [self.buttonResultsAbnormalYes setSelected:FALSE];
}

- (IBAction)buttonHPVtestedNoPressed:(id)sender {
    [self.buttonHPVyes setSelected:FALSE];
    [self.buttonHPVno setSelected:TRUE];
}

- (IBAction)buttonHPVtestedYesPressed:(id)sender {
    [self.buttonHPVyes setSelected:TRUE];
    [self.buttonHPVno setSelected:FALSE];
}

- (IBAction)buttonSavePressed:(id)sender {
    
    VALIDATE_RETURN validateReturn = [self validateInformation];
    
    if (validateReturn == RETURN_VALID) {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.datePicker.date forKey:keyForDefaults];
        if (showLabelHPV ) {
            NSLog(@"%@",[NSNumber numberWithBool:self.buttonHPVyes.isSelected] );
            [defaults setObject:[NSNumber numberWithBool:self.buttonHPVyes.isSelected] forKey:KEY_HPV_TESTED];
        }
        if (showLabelAbnormal) {
            NSLog(@"%@",[NSNumber numberWithBool:self.buttonResultsAbnormalYes.isSelected] );
            if (self.pickerType == PickExamDateMammo) {
                [defaults setObject:[NSNumber numberWithBool:self.buttonResultsAbnormalYes.isSelected] forKey:KEY_ABNORMAL_RESULTS_MAMMO];
            } else {
                [defaults setObject:[NSNumber numberWithBool:self.buttonResultsAbnormalYes.isSelected] forKey:KEY_ABNORMAL_RESULTS_PAP];
            }
        }
        
        [defaults setObject:self.datePicker.date forKey:keyForDefaults];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } else if (validateReturn == RETURN_DATE_INCORRECT) {
        # warning unfinished implementation
    } else if (validateReturn == RETURN_QUESTION_UNANSWERED) {
        # warning unfinished implementation
    }
}

    








@end
