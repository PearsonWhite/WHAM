//
//  FamilyHistoryViewController.m
//  WHAM
//
//  Created by Pearson White on 3/6/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "FamilyHistoryViewController.h"
#import "constants.h"

@interface FamilyHistoryViewController ()

@end

@implementation FamilyHistoryViewController

@synthesize keysArray;
@synthesize buttonArray;
@synthesize questionButton1_no, questionButton1_yes, questionButton2_Daughter, questionButton2_Mother, questionButton2_Sister;

NSDictionary* defaultsLocalDictFH = nil;

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
    
    defaultsLocalDictFH = [[NSMutableDictionary alloc] init];
	
    self.navigationController.navigationBarHidden = false;
    
    
    
    // setup button arrays
    self.buttonArray = [[NSMutableArray alloc] initWithObjects:
                        questionButton1_yes, questionButton1_no,
                        questionButton2_Mother, questionButton2_Sister, questionButton2_Daughter,
                        nil];
    self.keysArray = [[NSMutableArray alloc] initWithObjects:@"Placeholder", KEY_FAMILY_HISTORY_CANCER, KEY_MOTHER_CANCER, KEY_SISTER_CANCER, KEY_DAUGHTER_CANCER, nil];
    
    
    // settup button properties
    for (UIButton* button in buttonArray) {
        [button setBackgroundImage:[UIImage imageNamed:@"emptyBox.png"]
                          forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"checkedBox.png"]
                          forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(questionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
    
    // save button
    UIBarButtonItem *buttonSave = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(buttonSavePressed:)];
    self.navigationItem.rightBarButtonItem = buttonSave;
    
    
    [super viewWillAppear:animated];
    
    // update buttons
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    
    // check defaults for if user has already entered information
    if(![[[defaults dictionaryRepresentation] allKeys] containsObject:KEY_FAMILY_HISTORY_CANCER]){
        // for now we assume that all fields are filled out or none are
        // looks like none are filled
        for (UIButton* button in buttonArray) {
            [button setSelected:FALSE];
        }
    } else {
        for (NSUInteger index = 0; index < [buttonArray count]; index+=1) {
            // questionably set buttons to correct highlights
            if (index == 0) {
                if ([[defaults objectForKey:[keysArray objectAtIndex:index+1]] boolValue]) {
                    // yes
                    [[buttonArray objectAtIndex:index] setSelected:TRUE];
                    [[buttonArray objectAtIndex:index+1] setSelected:FALSE];
                    [self showDynamicGUI:TRUE];
                } else {
                    // no
                    [[buttonArray objectAtIndex:index] setSelected:FALSE];
                    [[buttonArray objectAtIndex:index+1] setSelected:TRUE];
                    [self showDynamicGUI:FALSE];
                }
            } else {
                if (index > 1) {
                    [[buttonArray objectAtIndex:index] setSelected:[[defaults objectForKey:[keysArray objectAtIndex:index]] boolValue]];
                }
                [defaultsLocalDictFH setValue:[defaults objectForKey:[keysArray objectAtIndex:index]] forKey:[keysArray objectAtIndex:index]];
            }
        }
        
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:FALSE animated:TRUE];
    [super viewWillDisappear:animated];
}

// used to set questions that only appear when certain answers are checked
- (void)showDynamicGUI:(BOOL)shouldShow {

    [self.labelWhichMembers setHidden:!shouldShow];
    [self.labelDaughter setHidden:!shouldShow];
    [self.labelMother setHidden:!shouldShow];
    [self.labelSister setHidden:!shouldShow];

    [self.questionButton2_Mother setHidden:!shouldShow];
    [self.questionButton2_Daughter setHidden:!shouldShow];
    [self.questionButton2_Sister setHidden:!shouldShow];
    
}

#pragma mark - IBActions

- (IBAction)buttonSavePressed:(id)sender {
    // standardUserDefaults = defaultsLocalDict
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    for (NSString* key in defaultsLocalDictFH) {
        [defaults setObject:[defaultsLocalDictFH valueForKey:key] forKey:key];
    }
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)questionButtonPressed:(id)sender {
    NSUInteger index = [buttonArray indexOfObject:(UIButton *)sender];
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    switch (index) {
        case 0: {
            // YES
            [defaultsLocalDictFH setValue:[NSNumber numberWithBool:YES] forKey:[keysArray objectAtIndex:index+1]];
            
            // select button
            [(UIButton*)sender setSelected:TRUE];
            
            // deselect mutually exclusive option
            [[buttonArray objectAtIndex:(index+1)] setSelected:FALSE];
            
            [self showDynamicGUI:TRUE];
            
            break;
        } case 1: {
            // NO
            [defaultsLocalDictFH setValue:[NSNumber numberWithBool:NO] forKey:[keysArray objectAtIndex:index]];
            
            // select button
            [(UIButton*)sender setSelected:TRUE];
            
            // deselect mutually exclusive option
            [[buttonArray objectAtIndex:(index-1)] setSelected:FALSE];
            
            [self showDynamicGUI:FALSE];
            
            break;
        } default: {
            // other buttons don't require deselecting a mutually exlusive option
            [(UIButton*)sender setSelected:![(UIButton*)sender isSelected]];
            break;
        }
    }
    
    [defaults setValue:[NSNumber numberWithBool:[(UIButton*)sender isSelected]] forKey:[keysArray objectAtIndex:index]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
