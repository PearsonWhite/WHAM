//
//  SettingsViewController.h
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SettingsViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *buttonResetInformation;

- (IBAction)buttonResetInformationPressed:(id)sender;

@end
