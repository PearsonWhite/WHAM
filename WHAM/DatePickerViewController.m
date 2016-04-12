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
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSDate* defaultDate;
    switch (self.pickerType) {
        case PickExamDateBDay: {
            self.title = @"Set Birth Date";
            keyForDefaults = KEY_BIRTH_DATE;
            break;
        } case PickExamDateMammo: {
            self.title = @"Set Last Mammogram Date";
            keyForDefaults = KEY_LAST_MAMMO_DATE;
            break;
        } case PickExamDatePap: {
            self.title = @"Set Last Pap Smear Date";
            keyForDefaults = KEY_LAST_PAP_DATE;
            break;
        }
            
        default:
            break;
    }
    
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
    
    // check for saved key and update datePicker accordingly
    if(![[[defaults dictionaryRepresentation] allKeys] containsObject:keyForDefaults]){
        defaultDate = [defaults objectForKey:keyForDefaults];
    } else {
        //todo
        // here we need to find an appropriate date to have as the default
        
        
        
        
        
        
        
        
        
        //todo
        //use_isEqualToString
        //!!!!!!!!asdf
    }
    
    
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    
    [super viewWillAppear:animated];
    
}






- (IBAction)buttonSavePressed:(id)sender {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.datePicker.date forKey:keyForDefaults];
}








@end
