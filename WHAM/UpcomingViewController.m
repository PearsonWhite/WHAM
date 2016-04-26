//
//  FirstViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "UpcomingViewController.h"

@interface UpcomingViewController ()

@end

@implementation UpcomingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    /*
     
     
     if([[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_BIRTH_DATE]){
     
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
