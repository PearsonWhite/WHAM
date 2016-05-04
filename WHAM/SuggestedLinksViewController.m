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

// titles for urls (the text displayed on the tableview cells for each link)
NSMutableArray* titleArr;


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
    
    dataArray = [[NSArray alloc] initWithObjects:@"Foobar", nil];
    self.TableViewObject.dataSource=self;
    self.TableViewObject.delegate=self;
    
    dataArray = [[NSArray alloc] initWithArray:[self getLinks]];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = self.title;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - tableview delage methods

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [titleArr objectAtIndex:indexPath.row];
    cell.textLabel.tag = indexPath.row;
    
    return cell;
}


// Tap on table Row
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[dataArray objectAtIndex:indexPath.row]]];
    
    
}

# pragma mark - suggested links logic

// Note: this logic is the same as in the Android Application

- (NSArray*)getLinks {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    titleArr = [[NSMutableArray alloc] init];
    
    //populate arr
    for (int linkIndex=0; linkIndex < LINKS_ARRAY_COUNT; linkIndex++) {
        [arr addObject:LINKS_ARRAY[linkIndex]];
    }
    for (int linkIndex=0; linkIndex < LINKS_ARRAY_COUNT; linkIndex++) {
        [titleArr addObject:LINKS_NAMES[linkIndex]];
    }
    
    
    // Choose links based on defaults values here
    
    NSMutableArray* linksArr = [[NSMutableArray alloc] init];
    
    
    int index = 0;
    
    NSDate* birthday = [defaults valueForKey:KEY_BIRTH_DATE];
    NSTimeInterval timeSinceBDay = [[NSDate date] timeIntervalSinceDate:birthday];
    double age = timeSinceBDay/(360.0*24.0*60.0*60.0);
    
    if ([[defaults objectForKey:KEY_SMOKES] boolValue] == FALSE) {
        
        for( int i = 0; i < 2; i++ ) {
            [titleArr addObject:[arr objectAtIndex:index]];
            [linksArr addObject:[arr objectAtIndex:index]];
            index++;
        }
    }
    else {
        
        for( int i = 0; i < 2; i++ ) {
            
            index++;
        }
    }
    
    if( age >= 21 && age <= 26 && !([defaults objectForKey:KEY_HPV_VACCINATED]) ) {
        
        for( int i = 0; i < 5; i++ ) {
            
            [linksArr addObject:[arr objectAtIndex:index]];
            [linksArr addObject:[arr objectAtIndex:index]];
            index++;
        }
    }
    else {
        
        for( int i = 0; i < 5; i++ ) {
            
            index++;
        }
    }
    
    if ([defaults objectForKey:KEY_FAMILY_HISTORY_CANCER]) {
        
        for (int i = 0; i < 3; i++) {
            
            [linksArr addObject:[arr objectAtIndex:index]];
            [linksArr addObject:[arr objectAtIndex:index]];
            index++;
        }
    }
    
    return (NSArray*)linksArr;
}



@end
