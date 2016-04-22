//
//  GeneratedReportViewController.m
//  WHAM
//
//  Created by Pearson White on 4/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "GeneratedReportViewController.h"
#import "constants.h"


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
            
            
            // experimenting. is this the way we get proper values from the users personal info?
            // age has being declared as a string in constants and not saved anywhere
            
            NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
            if([[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_SMOKES]){
                NSLog(@"The code runs through here!");
                NSLog(@"string: %@", KEY_SMOKES);
                
            }
            
            
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

/*
 LOGIC: 
 
 age:
 21-30: 1
 30-40: 2 (1 or 2)
 40-50: 2, 4
 50-65: 2, (1 or 2) 8
 > 65 : 3, 8
 
 Last Pap: 
 normal: do nothing
 abnormal: 5
 
 Last Mammo:
 normal: do nothing
 abnormal: 4
 
 Past medical history:
    History of HPV:
        Yes: 5
        No : do nothing
 
    Vaccinated against HPV: link to CPC? (no idea what this means)
        Yes: do nothing
        No: 
            age < 26: 9
            age > 26: do nothing
 

    Surgery:
        Hysterectomoy:
            yes: 5
                cancer: 5
            no:: do nothing
            
    Family Medical History:
        Yes:
            Mother daugther sisiter: 4
 
 
    Social History:
        Yes: 10
        No : do nothing
 
 
    USPSTF:
    21-30: 9,
        recommendation 3 years if normal
 
    30-65: 9,
        recommendation 3 years if normal
        
        OR if abnormal: 5 years with HPV testings
 
    > 65: discontinue
 
 
    Mammo:
        40-50: discuss with doctor
 
        > 50: every 2 year mammo
 */

/*
    Numbers above refer to the following recommendations:
    1: Papsmear exam 3 years if normal, else every 5 years
    2: Pap every 5 years with HPV if normal, else 5 years? 
    3: > 65 discontinue pap smear if normal
 
    4: talk to doctor re mammo
    5: talk to doctor re pap
    6: breast cancer risk assmesment calculator?
 
    8: recommend 9, 2 year mammo
    9: consider HPV vaccination to decrease risk cervical cancer (some link)
    10: more link, need to ask andy
 */

@end
