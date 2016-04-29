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

- (NSString*) intToMonth:( int ) number
{
    switch ( number ) {
            
        case 1:
            return @"January";
            
        case 2:
            return @"February";
            
        case 3:
            return @"March";
            
        case 4:
            return @"April";
            
        case 5:
            return @"May";
            
        case 6:
            return @"June";
            
        case 7:
            return @"July";
            
        case 8:
            return @"August";
            
        case 9:
            return @"September";
            
        case 10:
            return @"October";
            
        case 11:
            return @"November";
            
        case 12:
            return @"December";

        default:
            NSLog (@"Error intToMonth: invalid parameter ");
            break;
    }
    return 0;
}

- (NSString*) suggestedLinksMessage
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    NSString* message = @"Since ";
    Boolean comma = false;
    Boolean andOne = false;
    Boolean andTwo = false;
    Boolean andThree = false;
    Boolean messageGiven = false;
    
    NSDate* birthday = [defaults valueForKey:KEY_BIRTH_DATE];
    NSTimeInterval timeSinceBDay = [[NSDate date] timeIntervalSinceDate:birthday];
    double age = timeSinceBDay/(360.0*24.0*60.0*60.0);
    
    // example
    if([[defaults valueForKey:KEY_SMOKES] boolValue] ) {
        message = [message stringByAppendingString:@"you are a smoker"];
        andOne = true;
        messageGiven = true;
        
        // if( !sp.getBoolean( "breastCancer", false ) ) {
        if( ![[defaults valueForKey:KEY_FAMILY_HISTORY_CANCER] boolValue] ) {
            
            andTwo = true;
        }
        else {
            
            comma = true;
        }
    }
    
    // if( age >= 21 && age <= 26 && !sp.getBoolean( "vaccinated", true ) ) {
    if( age >= 21 && age <= 26 && ![[defaults valueForKey:KEY_HPV_VACCINATED] boolValue] ) {
        
        if( andTwo ) {
            message = [message stringByAppendingString:@" & "];
        }
        if( comma ) {
            message = [message stringByAppendingString:@" , "];
        }
        
        message = [message stringByAppendingString:@"you have not been vaccinated against HPV"];
        andThree = true;
        messageGiven = true;
    }
    
    // if( sp.getBoolean( "breastCancer", false ) ) {
    if( [[defaults valueForKey:KEY_FAMILY_HISTORY_CANCER] boolValue] ) {
        
        if( andOne || andThree ) {
            
            message = [message stringByAppendingString:@" & "];
        }

        message = [message stringByAppendingString:@" your family has a history of breast cancer "];
        messageGiven = true;
    }
    
    if( !messageGiven ) {
        
        message = @"";
    }
    else {
        
        message = [message stringByAppendingString:@" please see the suggested links."];
    }
    
    // printf("%s", [message cStringUsingEncoding:[NSString defaultCStringEncoding]]);
    return message;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = self.title;

    
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    NSDate* birthday = [defaults valueForKey:KEY_BIRTH_DATE];
    NSTimeInterval timeSinceBDay = [[NSDate date] timeIntervalSinceDate:birthday];
    double age = timeSinceBDay/(360.0*24.0*60.0*60.0);
    NSString* message = @" ";

    int yearsUntilNext = 0;
    GeneratedSuggestion action = GeneratedSuggestionNone;
    
    
    switch (self.generatedType) {
            
        case GeneratedPap: {
            if ([defaults objectForKey:KEY_HISTORY_HPV] == FALSE) {
            
                
                if ([[defaults objectForKey:KEY_HISTERECTOMY_FOR_CANCER] boolValue] == FALSE) {
                    
                    message = [message stringByAppendingString:@"Since you have had a hysterectomy & it was not due to cancer, you are no longer scheduled to have any additional Pap Smear procedures. "];
                }
            }
            else {
                
                if( age > 65 ) {
                    if ([[defaults objectForKey:KEY_ABNORMAL_RESULTS_PAP] boolValue] == TRUE) {
                        
                        message = [message stringByAppendingString:@"The results of your last Pap Smear exam were abnormal, it is recommended that you talk to your Doctor to get more information. "];
                    }
                    else {
                        message = [message stringByAppendingString:@"Since you are over the age of 65, you are no longer scheduled to have any additional Pap Smear procedures. "];
                    }
                }
                else {
                    /*
                    int day = sp.getInt( "LastPapDay", 0);
                    int month = sp.getInt( "LastPapMonth", 0);
                    int year = sp.getInt( "LastPapYear", 0);
                    
                    message += "Your last Pap Smear exam was on " + month + "/" + day + "/" + year + ". ";
                    */
                    
                    if ([[defaults objectForKey:KEY_ABNORMAL_RESULTS_PAP] boolValue] == FALSE) {
                        
                        message = [message stringByAppendingString:@"The results of your last Pap Smear exam were abnormal, it is recommended that you talk to your Doctor to get more information. "];
                    }
                    else {
                        /*
                        if( scheduleImmediately() ) {
                            
                            message = [message stringByAppendingString:@"Your last Pap Smear exam exceeds the recommended time between exams, please schedule an examination immediately! "';
                        }
                        else {
                            
                            message = [message stringByAppendingString:@"The results of your last Pap Smear were normal, you are scheduled for your next Pap Smear examination during
                            intToMonth(month) + " " + getNextExamYear() + ". ";
                        }
                         */
                        
                        action = GeneratedSuggestionTalkToDoctor;
                    }
                }
            
            
            
            /*
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
            */
            // NSString* message = [self suggestedLinksMessage];
            // message = suggestedLinksMessage();
            break;
        }
        case GeneratedMammo: {
            // generate mammogram report logic here
            // NSString* message = @"";
            message = @" ";
            
            NSDate* lastmammodate = [defaults valueForKey:KEY_LAST_MAMMO_DATE];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            // NSString *dateString = [dateFormatter stringFromDate:lastmammodate];
        
            NSUInteger componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
            NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:lastmammodate];
            NSInteger myear = [components year];
            // NSInteger mmonth = [components month];
            
            NSDate *date = [NSDate date];
            NSUInteger temp = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
            NSDateComponents *curcomponents = [[NSCalendar currentCalendar] components:temp fromDate:date];
            NSInteger year = [curcomponents year];
            // NSInteger month = [curcomponents month];
            
            if( age >= 40 ) {
                
                // if (sp.getBoolean("mammoDateGiven", false)) {
                if([[defaults valueForKey:KEY_LAST_MAMMO_DATE] boolValue] ) {
                    
                    // ( sp.getBoolean( "abnormalMammo", false  ) ) {
                    if([[defaults valueForKey:KEY_ABNORMAL_RESULTS_MAMMO] boolValue] ) {
                        
                        message = [message stringByAppendingString:@"The results of your last Mammogram exam were abnormal, it is recommended that you talk to your Doctor to get more information. "];
                        
                    }
                    else {
                        if ((year - myear) > 2) {
                            message = [message stringByAppendingString:@"Your last Mammogram exam exceeds the recommended time between exams, please schedule an examination immediately! "];
                            
                        } else {
                            year += 2;
                            message = [message stringByAppendingString:@"The results of your last Mammogram were normal, you are scheduled for your next Mammogram examination during "];//
                            // + @(month).stringValue + " " +  @(year).stringValue + ". ";
                        }
                    }
                }
            } else {
                message = [message stringByAppendingString:@"You are under 40 years old so there is nothing to report. "];
            }
            
            
            
            NSString *temp2 = [self suggestedLinksMessage];
            message = [message stringByAppendingString: temp2];
            // tvMammoReportMessage.setText( message );
        }
        break;
            
        default:
            break;
        }
            
    }
    
    //[self.labelGeneratedReport setText:[NSString stringWithFormat:@"%@", message]];
    
    
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
        
        NSString* prefix = [NSString stringWithFormat:@"Next exam date should be in the month of %ld-%ld-%ld", (long)nextExamMonth, (long)nextExamYear, (long)nextExamDay];
        
        NSString* newMessage = [NSString stringWithFormat:@"%@\n%@", prefix, message];
        
        [self.labelGeneratedReport setText:newMessage];
        
    } else if (action == GeneratedSuggestionTalkToDoctor) {
        NSString* prefix = @"Talk to your doctor about scheduling an exam.";
        NSString* newMessage = [NSString stringWithFormat:@"%@\n%@", prefix, message];
        [self.labelGeneratedReport setText:newMessage];
    } else if (action == GeneratedSuggestionDiscontinue) {
        NSString* prefix = @"discontinue exams";
        NSString* newMessage = [NSString stringWithFormat:@"%@\n%@", prefix, message];
        [self.labelGeneratedReport setText:newMessage];
    } else {
        [self.labelGeneratedReport setText:[NSString stringWithFormat:@"%@", message]];
    }
    

}

- (int) calculateDate:(NSDate*) date
{
    // NSString* message = @"";
    // NSDate* lastmammodate = [defaults valueForKey:KEY_LAST_MAMMO_DATE];
    NSTimeInterval timeSinceDate = [[NSDate date] timeIntervalSinceDate:date];
    int years = (int) timeSinceDate/(360.0*24.0*60.0*60.0);
    // printf("Calculate Date Debugging %g", years);
    return years;
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
