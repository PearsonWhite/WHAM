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
                        questionButton2_Mother, questionButton2_Sister, questionButton2_Daughter,
                        nil];
    self.keysArray = [[NSMutableArray alloc] initWithObjects:KEY_FAMILY_HISTORY_CANCER, KEY_MOTHER_CANCER, KEY_SISTER_CANCER, KEY_DAUGHTER_CANCER, nil];
    
    
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
            NSLog(@"KEY: %d  VALUE: %d", index, ![[keysArray objectAtIndex:index] boolValue]);
            if (index == 0) {
                if ([[defaults objectForKey:[keysArray objectAtIndex:index]] boolValue]) {
                    [[buttonArray objectAtIndex:index] setSelected:TRUE];
                    [[buttonArray objectAtIndex:index+1] setSelected:FALSE];
                } else {
                    [[buttonArray objectAtIndex:index] setSelected:FALSE];
                    [[buttonArray objectAtIndex:index] setSelected:TRUE];
                }
            } else if (index > 1) {
                [[buttonArray objectAtIndex:index] setSelected:[[defaults objectForKey:[keysArray objectAtIndex:index]] boolValue]];
            }
        }
    }
}

- (IBAction)questionButtonPressed:(id)sender {
    NSLog(@"Button index: %d", [buttonArray indexOfObject:(UIButton *)sender]);
    NSUInteger index = [buttonArray indexOfObject:(UIButton *)sender];
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    switch (index) {
        case 0: {
            // YES
            [defaults setValue:[NSNumber numberWithBool:YES] forKey:[keysArray objectAtIndex:index]];
            
            // select button
            [(UIButton*)sender setSelected:TRUE];
            
            // deselect mutually exclusive option
            [[buttonArray objectAtIndex:(index+1)] setSelected:FALSE];
            
            break;
        } case 1: {
            // NO
            [defaults setValue:[NSNumber numberWithBool:NO] forKey:[keysArray objectAtIndex:index]];
            
            // select button
            [(UIButton*)sender setSelected:FALSE];
            
            // deselect mutually exclusive option
            [[buttonArray objectAtIndex:(index-1)] setSelected:TRUE];
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
