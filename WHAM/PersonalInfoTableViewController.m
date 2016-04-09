//
//  PersonalInfoTableViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "PersonalInfoTableViewController.h"
#import "DateCell.h"

@interface PersonalInfoTableViewController ()

@end

@implementation PersonalInfoTableViewController

@synthesize expandedCellIndex, dateCellHeight;
@synthesize delegate;


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return [self sharedInit:self];
}

- (id)sharedInit:(id)selfID {
    expandedCellIndex = -1;
    dateCellHeight = 219;
    return selfID;
}

- (id)init {
    self = [super init];
    return [self sharedInit:self];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self sharedInit:self];
    }
    return self;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"asdfasdf");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
