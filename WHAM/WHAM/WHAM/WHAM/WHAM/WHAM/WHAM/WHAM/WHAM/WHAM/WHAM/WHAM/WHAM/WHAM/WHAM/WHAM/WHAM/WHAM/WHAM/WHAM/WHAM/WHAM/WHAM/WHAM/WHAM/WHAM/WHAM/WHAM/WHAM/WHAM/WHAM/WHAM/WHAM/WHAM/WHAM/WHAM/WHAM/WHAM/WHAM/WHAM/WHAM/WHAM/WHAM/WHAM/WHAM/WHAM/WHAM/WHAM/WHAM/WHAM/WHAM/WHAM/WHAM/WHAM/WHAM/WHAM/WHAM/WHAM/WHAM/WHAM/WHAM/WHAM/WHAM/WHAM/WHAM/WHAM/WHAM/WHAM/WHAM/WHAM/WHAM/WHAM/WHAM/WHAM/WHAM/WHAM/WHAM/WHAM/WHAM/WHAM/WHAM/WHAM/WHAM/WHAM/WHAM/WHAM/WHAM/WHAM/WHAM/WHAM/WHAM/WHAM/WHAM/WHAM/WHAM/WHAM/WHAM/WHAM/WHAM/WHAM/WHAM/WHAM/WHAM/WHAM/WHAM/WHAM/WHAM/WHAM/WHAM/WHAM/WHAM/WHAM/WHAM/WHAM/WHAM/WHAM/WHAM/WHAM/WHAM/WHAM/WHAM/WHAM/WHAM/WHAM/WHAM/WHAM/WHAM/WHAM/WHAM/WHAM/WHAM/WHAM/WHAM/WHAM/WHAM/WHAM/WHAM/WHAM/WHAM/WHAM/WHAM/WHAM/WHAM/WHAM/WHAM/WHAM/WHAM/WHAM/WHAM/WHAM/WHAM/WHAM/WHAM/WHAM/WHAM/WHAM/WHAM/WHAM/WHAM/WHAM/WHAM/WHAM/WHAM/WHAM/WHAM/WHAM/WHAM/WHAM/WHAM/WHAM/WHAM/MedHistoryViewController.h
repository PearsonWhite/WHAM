//
//  MedHistoryViewController.h
//  WHAM
//
//  Created by Pearson White on 3/6/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedHistoryViewController : UIViewController


@property IBOutlet UIButton* questionButton1_yes;
@property IBOutlet UIButton* questionButton1_no;
@property IBOutlet UIButton* questionButton2_yes;
@property IBOutlet UIButton* questionButton2_no;
@property IBOutlet UIButton* questionButton3_yes;
@property IBOutlet UIButton* questionButton3_no;
@property IBOutlet UIButton* questionButton4_yes;
@property IBOutlet UIButton* questionButton4_no;

@property NSMutableArray* buttonArray;
@property NSMutableArray* keysArray;

- (IBAction)questionButtonPressed:(id)sender;

@end
