//
//  DatePickerViewController.h
//  WHAM
//
//  Created by Pearson White on 3/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

typedef enum { PickExamDatePap, PickExamDateMammo, PickExamDateBDay } PickViewType;

@property (nonatomic) PickViewType pickerType;


@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIButton *buttonSave;



@property (strong, nonatomic) IBOutlet UILabel *labelResultsAbnormal;
@property (strong, nonatomic) IBOutlet UILabel *labelResultsAbnormalYes;
@property (strong, nonatomic) IBOutlet UILabel *labelResultsAbnormalNo;
@property (strong, nonatomic) IBOutlet UIButton *buttonResultsAbnormalNo;
@property (strong, nonatomic) IBOutlet UIButton *buttonResultsAbnormalYes;



@property (strong, nonatomic) IBOutlet UILabel *labelTestedForHPV;
@property (strong, nonatomic) IBOutlet UILabel *labelTestedForHPVyes;
@property (strong, nonatomic) IBOutlet UILabel *labelTestedForHPVno;
@property (strong, nonatomic) IBOutlet UIButton *buttonHPVno;
@property (strong, nonatomic) IBOutlet UIButton *buttonHPVyes;


@property (nonatomic) bool showLabelHPV;
@property (nonatomic) bool showLabelAbnormal;

- (IBAction)buttonAbnormalYesPressed:(id)sender;
- (IBAction)buttonAbnormalNoPressed:(id)sender;




- (IBAction)buttonHPVtestedNoPressed:(id)sender;
- (IBAction)buttonHPVtestedYesPressed:(id)sender;






- (IBAction)buttonSavePressed:(id)sender;




@end
