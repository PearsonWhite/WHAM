//
//  FamilyHistoryViewController.h
//  WHAM
//
//  Created by Pearson White on 3/6/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamilyHistoryViewController : UIViewController

@property IBOutlet UIButton* questionButton1_yes;
@property IBOutlet UIButton* questionButton1_no;

@property IBOutlet UIButton* questionButton2_Mother;
@property IBOutlet UIButton* questionButton2_Sister;
@property IBOutlet UIButton* questionButton2_Daughter;


@property NSMutableArray* buttonArray;
@property NSMutableArray* keysArray;


@end
