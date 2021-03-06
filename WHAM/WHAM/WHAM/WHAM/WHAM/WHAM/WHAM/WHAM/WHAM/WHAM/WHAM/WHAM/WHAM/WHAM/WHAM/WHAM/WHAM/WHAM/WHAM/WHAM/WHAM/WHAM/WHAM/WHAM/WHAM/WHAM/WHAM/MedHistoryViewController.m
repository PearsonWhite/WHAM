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
    
    
    
    // setup arrays
    self.buttonArray = [[NSMutableArray alloc] initWithObjects:
                        questionButton1_yes, questionButton1_no,
                        questionButton2_yes, questionButton2_no,
                        questionButton3_yes, questionButton3_no,
                        questionButton4_yes, questionButton4_no,
                        nil];
    self.keysArray = [[NSMutableArray alloc] initWithObjects:KEY_HISTORY_HPV, KEY_HISTORY_HPV, KEY_HPV_VACCINATED, KEY_HPV_VACCINATED, KEY_HAD_HISTERECTOMY, KEY_HAD_HISTERECTOMY, KEY_HISTERECTOMY_FOR_CANCER, KEY_HISTERECTOMY_FOR_CANCER, nil];
    
    
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
                NSLog(@"KEY: %d  VALUE: %d", index, [[keysArray objectAtIndex:index] boolValue]);
            } else {
                // NO button (use opposite)
                [[buttonArray objectAtIndex:index] setSelected:![[defaults objectForKey:[keysArray objectAtIndex:index]] boolValue]];
                NSLog(@"KEY: %d  VALUE: %d", index, ![[keysArray objectAtIndex:index] boolValue]);
            }
        }
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)loadSavedAnswers {
    
}


- (IBAction)questionButtonPressed:(id)sender {
    NSLog(@"Button index: %d", [buttonArray indexOfObject:(UIButton *)sender]);
    
    // potential code duplication.
    // could have just used bool var = !([buttonArray indexOfObject:(UIButton *)sender] % 2))
    // and I wouldn't need if/else with 2 nearly identical blocks.
    // (note the indexes (+1 and -1) would have to account, but still less code dupe
    if (!([buttonArray indexOfObject:(UIButton *)sender] % 2)) {
        // YES button
        
        // update NSUserDefaults
        NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
        [defaults setValue:[NSNumber numberWithBool:YES] forKey:[keysArray objectAtIndex:[buttonArray indexOfObject:((UIButton*) sender)]]];
        
        // select button
        [[buttonArray objectAtIndex:([buttonArray indexOfObject:((UIButton*) sender)])] setSelected:TRUE];
        
        // deselect mutually exclusive option
        [[buttonArray objectAtIndex:([buttonArray indexOfObject:((UIButton*) sender)]+1)] setSelected:FALSE];
    } else {
        // NO button
        
        // update NSUserDefaults
        NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
        [defaults setValue:[NSNumber numberWithBool:NO] forKey:[keysArray objectAtIndex:[buttonArray indexOfObject:((UIButton*) sender)]]];
        
        // select button
        [[buttonArray objectAtIndex:([buttonArray indexOfObject:((UIButton*) sender)])] setSelected:TRUE];
        
        // deselect mutually exclusive option
        [[buttonArray objectAtIndex:([buttonArray indexOfObject:((UIButton*) sender)]-1)] setSelected:FALSE];
    }
    NSLog(@"isHighlighted: %d", ((UIButton*)sender).isSelected);
    
    
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    for (NSUInteger index = 0; index < [buttonArray count]; index+=1) {
        // questionably set buttons to correct highlights
        if (!(index % 2)) {
            // YES button
            [[buttonArray objectAtIndex:index] setSelected:[[defaults objectForKey:[keysArray objectAtIndex:index]] boolValue]];
            NSLog(@"KEY: %d  VALUE: %d", index, [[keysArray objectAtIndex:index] boolValue]);
        } else {
            // NO button (use opposite)
            [[buttonArray objectAtIndex:index] setSelected:![[defaults objectForKey:[keysArray objectAtIndex:index]] boolValue]];
            NSLog(@"KEY: %d  VALUE: %d", index, ![[keysArray objectAtIndex:index] boolValue]);
        }
    }
}






@end
