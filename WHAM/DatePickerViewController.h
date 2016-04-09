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

- (IBAction)buttonSavePressed:(id)sender;

@end
