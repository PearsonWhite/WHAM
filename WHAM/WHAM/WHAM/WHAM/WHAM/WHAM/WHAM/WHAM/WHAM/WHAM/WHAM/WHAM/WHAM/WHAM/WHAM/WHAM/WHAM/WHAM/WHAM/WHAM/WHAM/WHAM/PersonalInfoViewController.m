//
//  PersonalInfoViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "PersonalInfoViewController.h"

@interface PersonalInfoViewController ()

@end


@implementation PersonalInfoViewController



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
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = true;
}

- (void)selectedCellWithInfo:(NSString *)segueName {
    [self performSegueWithIdentifier:segueName sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"personalInfoTable_embed"]) {
        PersonalInfoTableViewController * childViewController = (PersonalInfoTableViewController *) [segue destinationViewController];
        //UITableView * tableview = childViewController.view;
        // do something with the AlertView's subviews here...
        childViewController.delegate = self;
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
