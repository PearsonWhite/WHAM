//
//  PersonalInfoViewController.h
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalInfoTableViewController.h"

@interface PersonalInfoViewController : UIViewController //<MyTableDelegate> // UIViewController <UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UIButton *buttonEnterBirthday;
@property (strong, nonatomic) IBOutlet UIButton *buttonLastProcedures;
@property (strong, nonatomic) IBOutlet UIButton *buttonPastMedHistory;
@property (strong, nonatomic) IBOutlet UIButton *buttonFamilyHistory;
@property (strong, nonatomic) IBOutlet UIButton *buttonSmokeYes;
@property (strong, nonatomic) IBOutlet UIButton *buttonSmokeNo;

- (IBAction)buttonEnterBirthdayPressed:(id)sender;
- (IBAction)buttonLastProceduresPressed:(id)sender;
- (IBAction)buttonPastMedHistoryPressed:(id)sender;
- (IBAction)buttonFamilyHistoryPressed:(id)sender;
- (IBAction)buttonSmokeYesPressed:(id)sender;
- (IBAction)buttonSmokeNoPressed:(id)sender;



@end


