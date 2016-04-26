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
@synthesize labelGeneratedReport;

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

    
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    
    NSDate* birthday = [defaults valueForKey:KEY_BIRTH_DATE];
    NSTimeInterval timeSinceBDay = [[NSDate date] timeIntervalSinceDate:birthday];
    double age = timeSinceBDay/(360.0*24.0*60.0*60.0);
    
    int yearsUntilNext = 0;
    GeneratedSuggestion action;
    
    
    
    
    switch (self.generatedType) {
            
        case GeneratedPap: {
            
            if (![[defaults valueForKey:KEY_ABNORMAL_RESULTS_PAP] boolValue]) {
                // if under 65 every 3 years
                if (age < 65) {
                    //every 3 years
                    action = GeneratedSuggestionNextExam;
                    yearsUntilNext = 3;
                } else {
                    // discontinue
                    action = GeneratedSuggestionDiscontinue;
                }
            } else {
                // abnormal
                action = GeneratedSuggestionTalkToDoctor;
            }
            
            // 1: Papsmear exam 3 years if normal, else every 5 years
            // 2: Pap every 5 years with HPV if normal, else 5 years?
            // 3: > 65 discontinue pap smear if normal
            // 4: talk to doctor re mammo
            
            break;
        }
        case GeneratedMammo: {
            // generate mammogram report logic here
            break;
        }
        default:
            break;
    }
    
    if (action == GeneratedSuggestionNextExam) {
        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
        NSDate *now = [NSDate date];
        NSCalendar *gregorian = [NSCalendar currentCalendar];
        NSDateComponents *comps = [gregorian components:unitFlags fromDate:now];
        [comps setYear:[comps year] + yearsUntilNext];
        NSDate *nextExamDate = [gregorian dateFromComponents:comps];
        
        NSUInteger componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit|NSDayCalendarUnit;
        NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:nextExamDate];
        NSInteger nextExamYear = [components year];
        NSInteger nextExamMonth = [components month];
        NSInteger nextExamDay = [components day];
        
        [self.labelGeneratedReport setText:[NSString stringWithFormat:@"Next exam date should be in the month of %ld-%ld-%ld", (long)nextExamMonth, (long)nextExamYear, (long)nextExamDay]];
    } else if (action == GeneratedSuggestionTalkToDoctor) {
        [self.labelGeneratedReport setText:@"Talk to you doctor."];
    } else if (action == GeneratedSuggestionDiscontinue) {
        [self.labelGeneratedReport setText:@"discontinue exams"];
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
