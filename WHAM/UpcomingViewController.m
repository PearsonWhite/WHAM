//
//  FirstViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "UpcomingViewController.h"
#import "constants.h"

@interface UpcomingViewController ()

@end

@implementation UpcomingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}




- (void)setPapText {
    /*
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    NSDate* birthday = [defaults valueForKey:KEY_BIRTH_DATE];
    NSTimeInterval timeSinceBDay = [[NSDate date] timeIntervalSinceDate:birthday];
    double age = timeSinceBDay/(360.0*24.0*60.0*60.0);
        
    if ([[defaults objectForKey:KEY_HISTORY_HPV] boolValue] == FALSE) {
        
        
        if ([defaults objectForKey:KEY_HISTERECTOMY_FOR_CANCER]) {
            
            //tvUpcomingPap.setText("DISCONTINUED DUE TO SURGERY");
        }
        else {
            
            if([[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_BIRTH_DATE] == FALSE){
                
                if ([[defaults objectForKey:KEY_BIRTH_DATE] boolValue] == FALSE) {
                
                    if ([[defaults objectForKey:KEY_ABNORMAL_RESULTS_PAP] boolValue] == TRUE) {
                        
                        //tvUpcomingPap.setText("SEE PAP SMEAR REPORT");
                    }
                    else {
                        
                        if( scheduleImmediately() ) {
                            
                            tvUpcomingPap.setText("SCHEDULE IMMEDIATELY");
                        }
                        else {
                            
                            displayPapInfo();
                        }
                    }
                }
                else {
                    
                    //tvUpcomingPap.setText("PLEASE ENTER YOUR AGE IN PERSONAL INFO");
                }
                
            }
            else {
                
                //tvUpcomingPap.setText("NO RECORD OF LAST EXAM");
            }
        }
    }
    else {
        if ( age > 65 ) {
            
            if ([[defaults objectForKey:KEY_ABNORMAL_RESULTS_PAP] boolValue] == TRUE) {
                
                tvUpcomingPap.setText("SEE PAP SMEAR REPORT");
            }
            else {
                
                tvUpcomingPap.setText("DISCONTINUED DUE TO AGE");
            }
        }
        else {
            
            
            if(sp.getBoolean("papDateGiven", false)) {
                
                if( sp.getBoolean( "ageGiven", false ) ) {
                    
                    if (sp.getBoolean("abnormalPap", true)) {
                        
                        tvUpcomingPap.setText("SEE PAP SMEAR REPORT");
                    }
                    else {
                        
                        if( scheduleImmediately() ) {
                            
                            tvUpcomingPap.setText("SCHEDULE IMMEDIATELY");
                        }
                        else {
                            
                            displayPapInfo();
                        }
                    }
                }
                else {
                    
                    tvUpcomingPap.setText("PLEASE ENTER YOUR AGE IN PERSONAL INFO");
                }
                
            }
            else {
                
                tvUpcomingPap.setText("NO RECORD OF LAST EXAM");
            }
        }
    }
      */
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewWillAppear:(BOOL)animated {
    
}



@end
