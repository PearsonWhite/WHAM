//
//  SuggestedLinksViewController.m
//  WHAM
//
//  Created by Pearson White on 4/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "SuggestedLinksViewController.h"
#import "constants.h"

@interface SuggestedLinksViewController ()

@end

@implementation SuggestedLinksViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = self.title;
    
    NSArray* linksArr = [self getLinks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray*)getLinks {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray* arr = [[NSMutableArray alloc] initWithObjects:LINKS_ARRAY count:LINKS_ARRAY_COUNT];
    // Choose links based on defaults values here
    
    
    
    NSArray* linksArr = [[NSArray alloc] initWithArray:(NSArray*)arr];
    
    return linksArr;
}








@end
