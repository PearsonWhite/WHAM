//
//  MedHistoryViewController.m
//  WHAM
//
//  Created by Pearson White on 3/6/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "MedHistoryViewController.h"
#import "constants.h"

@interface MedHistoryViewController ()

@end

@implementation MedHistoryViewController

@synthesize questionButton1_no, questionButton1_yes, questionButton2_no, questionButton2_yes, questionButton3_no, questionButton3_yes, questionButton4_no, questionButton4_yes;

@synthesize buttonArray, keysArray;

NSDictionary* defaultsLocalDictMH = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.navigationController.navigationBarHidden = false;
    
    
    
    // setup arrays (for keys and buttons)
    self.buttonArray = [[NSMutableArray alloc] initWithObjects:
                        questionButton1_yes, questionButton1_no,
                        questionButton2_yes, questionButton2_no,
                        questionButton3_yes, questionButton3_no,
                        questionButton4_yes, questionButton4_no,
                        nil];
    self.keysArray = [[NSMutableArray alloc] initWithObjects:
                      KEY_HISTORY_HPV,
                      KEY_HISTORY_HPV,
                      KEY_HPV_VACCINATED,
                      KEY_HPV_VACCINATED,
                      KEY_HAD_HISTERECTOMY,
                      KEY_HAD_HISTERECTOMY,
                      KEY_HISTERECTOMY_FOR_CANCER,
                      KEY_HISTERECTOMY_FOR_CANCER, nil];
    
    defaultsLocalDictMH = [[NSMutableDictionary alloc] init];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    // settup button properties
    for (UIButton* button in buttonArray) {
        [button setBackgroundImage:[UIImage imageNamed:@"emptyBox.png"]
                          forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"checkedBox.png"]
                          forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageNamed:@"checkedBox.png"]
                          forState:UIControlStateHighlighted];
        button.adjustsImageWhenHighlighted=YES;
        [button addTarget:self action:@selector(questionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // update buttons
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    
    // only apply if nsdefaults already has info on user
    if(![[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_HISTORY_HPV]){
        // for now we assume that all fields are filled out or none are
        for (UIButton* button in buttonArray) {
            [button setSelected:FALSE];
        }
    } else {
        for (NSUInteger index = 0; index < [buttonArray count]; index+=1) {
            // questionably set buttons to correct highlights
            if (!(index % 2)) {
                // YES button
                [[buttonArray objectAtIndex:index] setSelected:[[defaults objectForKey:[keysArray objectAtIndex:index]] boolValue]];
            } else {
                // NO button (use opposite)
                [[buttonArray objectAtIndex:index] setSelected:![[defaults objectForKey:[keysArray objectAtIndex:index]] boolValue]];
            }
        }
    }
    
    // save button
    UIBarButtonItem *buttonSave = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(buttonSavePressed:)];
    self.navigationItem.rightBarButtonItem = buttonSave;
    
    [self updateGUI];

}

// dynamically sets GUI (depending on user answers)
- (void)updateGUI {
    if ([[buttonArray objectAtIndex:5] isSelected]) {
        [self.labelDueToCancer setHidden:FALSE];
        [[buttonArray objectAtIndex:6] setHidden:FALSE];
        [[buttonArray objectAtIndex:7] setHidden:FALSE];
        [self.labelDueToCancerYes setHidden:FALSE];
        [self.labelDueToCancerNo setHidden:FALSE];
    } else {
        [self.labelDueToCancer setHidden:TRUE];
        [[buttonArray objectAtIndex:6] setHidden:TRUE];
        [[buttonArray objectAtIndex:7] setHidden:TRUE];
        [self.labelDueToCancerYes setHidden:TRUE];
        [self.labelDueToCancerNo setHidden:TRUE];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)loadSavedAnswers {
    
}

#pragma make - IBActions

- (IBAction)buttonSavePressed:(id)sender {
    // standardUserDefaults = defaultsLocalDict
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    for (NSString* key in defaultsLocalDictMH) {
        [defaults setObject:[defaultsLocalDictMH valueForKey:key] forKey:key];
    }
    [self.navigationController popViewControllerAnimated:TRUE];
}

// main logic for deselecting contrary check boxes (only YES or NO checked, not both)
- (IBAction)questionButtonPressed:(id)sender {
    
    // potential code duplication.
    // could have just used bool var = !([buttonArray indexOfObject:(UIButton *)sender] % 2))
    // and I wouldn't need if/else with 2 nearly identical blocks.
    // (note the indexes (+1 and -1) would have to account, but still less code dupe
    if (!([buttonArray indexOfObject:(UIButton *)sender] % 2)) {
        // YES button
        
        // update defaultsLocalDict
        [defaultsLocalDictMH setValue:[NSNumber numberWithBool:YES] forKey:[keysArray objectAtIndex:[buttonArray indexOfObject:((UIButton*) sender)]]];
        
        // select button
        [[buttonArray objectAtIndex:([buttonArray indexOfObject:((UIButton*) sender)])] setSelected:TRUE];
        
        // deselect mutually exclusive option
        [[buttonArray objectAtIndex:([buttonArray indexOfObject:((UIButton*) sender)]+1)] setSelected:FALSE];
    } else {
        // NO button
        
        // update defaultsLocalDict
        [defaultsLocalDictMH setValue:[NSNumber numberWithBool:NO] forKey:[keysArray objectAtIndex:[buttonArray indexOfObject:((UIButton*) sender)]]];
        
        // select button
        [[buttonArray objectAtIndex:([buttonArray indexOfObject:((UIButton*) sender)])] setSelected:TRUE];
        
        // deselect mutually exclusive option
        [[buttonArray objectAtIndex:([buttonArray indexOfObject:((UIButton*) sender)]-1)] setSelected:FALSE];
    }
    
    // update gui
    [self updateGUI];
    
    
}






@end
