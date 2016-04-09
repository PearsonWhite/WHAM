//
//  SecondViewController.m
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"moo");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSLog(@"we goin' to %@", identifier);
    [super performSegueWithIdentifier:identifier sender:sender];
}


-(IBAction)buttontestpressed:(id)sender {
    [self performSegueWithIdentifier:@"toWhateverViewController" sender:self];
}

@end
