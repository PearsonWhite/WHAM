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
    NSInteger age;

    
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    if([[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_BIRTH_DATE]){
        self.birthday = [defaults valueForKey:KEY_LAST_MAMMO_DATE];
        self.abnormal = [defaults valueForKey:KEY_ABNORMAL_RESULTS];
        self.history_hpv = [defaults valueForKey:KEY_HISTORY_HPV];
        
        
/*
        FOUNDATION_EXPORT NSString *const KEY_HISTORY_HPV;
        FOUNDATION_EXPORT NSString *const KEY_HPV_VACCINATED;
        FOUNDATION_EXPORT NSString *const KEY_HAD_HISTERECTOMY;
        FOUNDATION_EXPORT NSString *const KEY_HISTERECTOMY_FOR_CANCER;
        
        FOUNDATION_EXPORT NSString *const KEY_FAMILY_HISTORY_CANCER;
        FOUNDATION_EXPORT NSString *const KEY_MOTHER_CANCER;
        FOUNDATION_EXPORT NSString *const KEY_SISTER_CANCER;
        FOUNDATION_EXPORT NSString *const KEY_DAUGHTER_CANCER;
        
        // use number as a bool when setting/getting
        FOUNDATION_EXPORT NSString *const KEY_SMOKES;
        
        FOUNDATION_EXPORT NSString *const KEY_BIRTH_DATE;
        FOUNDATION_EXPORT NSString *const KEY_LAST_MAMMO_DATE;
        FOUNDATION_EXPORT NSString *const KEY_LAST_PAP_DATE;
        
        FOUNDATION_EXPORT NSString *const KEY_ABNORMAL_RESULTS;
        FOUNDATION_EXPORT NSString *const KEY_HPV_TESTED;
        
        FOUNDATION_EXPORT NSString *const LINKS_ARRAY[];
        FOUNDATION_EXPORT uint const LINKS_ARRAY_COUNT;
        FOUNDATION_EXPORT NSString *const LINKS_NAMES[];
*/
        
        NSUInteger componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit|NSDayCalendarUnit;
        NSDateComponents *bdaycomponents = [[NSCalendar currentCalendar] components:componentFlags fromDate:self.birthday];
        NSInteger byear = [bdaycomponents year];
        NSInteger bmonth = [bdaycomponents month];
        NSInteger bday = [bdaycomponents day];
        NSLog(@"bday %ld, %ld, %ld", (long)byear, (long)bmonth, (long)bday);
        
        NSDate* date = [NSDate date];
        NSDateComponents *datecomponents = [[NSCalendar currentCalendar] components:componentFlags fromDate:date];
        NSInteger dateyear = [datecomponents year];
        NSInteger datemonth = [datecomponents month];
        NSInteger dateday = [datecomponents day];
        NSLog(@"date %ld, %ld, %ld", (long)dateyear, (long)datemonth, (long)dateday);
        
        age = dateyear - byear;
        if (datemonth < bmonth){
            age -= 1;
        }
        NSLog(@"age %ld", (long)age);
    }
    
    switch (generatedType) {
            
        case GeneratedPap: {
            if (self.abnormal){
                // 1: Papsmear exam every 5 years
                NSLog(@"1: Papsmear exam was abnormal");
                NSLog(@"1: Papsmear exam every 5 years");
            }
            else if (!self.abnormal){
                NSLog(@"1: Papsmear exam was normal");
                if(age > 21 && age < 30){
                    NSLog(@"1: Papsmear exam every 3 years");
                }
            }
            
            // 1: Papsmear exam 3 years if normal, else every 5 years
            // 2: Pap every 5 years with HPV if normal, else 5 years?
            // 3: > 65 discontinue pap smear if normal
            // 4: talk to doctor re mammo
            
            //[[] timeIntervalSinceDate:birthday];
            
            NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
            if([[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_BIRTH_DATE]){
                
                NSDate* birthday = [defaults valueForKey:KEY_BIRTH_DATE];
                NSTimeInterval timeSinceBDay = [[NSDate date] timeIntervalSinceDate:birthday];
                double age = timeSinceBDay/(360.0*24.0*60.0*60.0);
                NSLog(@"age: %f", age);
                
                NSNumber* smokesNum = [defaults valueForKey:KEY_SMOKES];
                if ([smokesNum boolValue]) {
                    NSLog(@"smokes");
                }
                
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
 */


 /*
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
