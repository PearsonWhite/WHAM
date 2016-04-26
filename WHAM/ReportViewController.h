//
//  SecondViewController.h
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportViewController : UIViewController

- (IBAction)buttonGeneratePapSmearReportPressed:(id)sender;

- (IBAction)buttonGenerateMammogramReportPressed:(id)sender;

- (IBAction)buttonSuggestedLinkesPressed:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *buttonGeneratePap;
@property (strong, nonatomic) IBOutlet UIButton *buttonGenerateMammo;
@property (strong, nonatomic) IBOutlet UIButton *buttonLinks;
@property (strong, nonatomic) IBOutlet UILabel *labelNotEnoughInfo;


@end
