//
//  LastProceduresViewController.h
//  WHAM
//
//  Created by Pearson White on 3/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LastProceduresViewController : UIViewController

// these @properties are used by the pushing VC to control what preference we're handling here
// Ex. lastMammo set by lastProcedures VC
@property NSDate* lastMammoDate;
@property NSDate* lastPapDate;

@property (strong, nonatomic) IBOutlet UIButton *buttonUpdateLastPap;


@property (strong, nonatomic) IBOutlet UIButton *buttonUpdateLastMammo;

@property (strong, nonatomic) IBOutlet UILabel *labelLastPap;

@property (strong, nonatomic) IBOutlet UILabel *labelLastMammo;

- (IBAction)buttonUpdateLastPapPressed:(id)sender;

- (IBAction)buttonUpdateLastMammoPressed:(id)sender;


@end
