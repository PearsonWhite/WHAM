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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    //[self.tableView registerClass:[DateCell class] forCellReuseIdentifier:@"DateCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DateCell" bundle:nil] forCellReuseIdentifier:@"DateCell"];

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    static NSString *DateCellIdentifier = @"DateCell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell;
    if (indexPath.row < 6 && (indexPath.row % 2)) {
        cell = [tableView dequeueReusableCellWithIdentifier:DateCellIdentifier forIndexPath:indexPath];
        [[(DateCell*)cell datePicker] setHidden:(indexPath.row != self.expandedCellIndex)];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    }
    
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = @"Birthday";
            break;
        } case 2: {
            cell.textLabel.text = @"Last Pap Smear";
            break;
        } case 4: {
            cell.textLabel.text = @"Last MammoGram";
            break;
        } case 6: {
            cell.textLabel.text = @"History";
            break;
        } case 7: {
            cell.textLabel.text = @"Family History";
            break;
        }
        default:
            break;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSLog(@"cellfor: %d: %@", indexPath.row, cell.textLabel.text);
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat returnValue = 0;
    if (indexPath.row < 6 && (indexPath.row % 2)) {
        //returnValue = (indexPath.row == self.expandedCellIndex) ? DATE_CELL_HEIGHT : 0;
        returnValue = (indexPath.row == self.expandedCellIndex) ? dateCellHeight : 0;
    } else {
        returnValue = self.tableView.rowHeight;
    }
    //NSLog(@"row: %d   return: %f",indexPath.row, returnValue);
    return returnValue;
}


#pragma mark - Table view delegates

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Pressed %d [expandedCellIndex: %d]", indexPath.row, expandedCellIndex);
    if (indexPath.row < 6 && !(indexPath.row % 2)) {
        int prevCellIndex = expandedCellIndex;
        if (expandedCellIndex == -1 && (indexPath.row+1 != expandedCellIndex) ) {
            // opening a cell
            //expandedCellIndex = (indexPath.row+1 == expandedCellIndex ? -1 : indexPath.row+1);
            expandedCellIndex = indexPath.row+1;
            [UIView animateWithDuration:.4 animations:^(void){
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:expandedCellIndex inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
            }];
        } else {
            // closing previous cell
            expandedCellIndex = -1;
            [UIView animateWithDuration:.4 animations:^(void){
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:prevCellIndex inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
            }];
            
            
        }
    } else {
        NSMutableString* segueName = [[NSMutableString alloc] initWithString:@""];
        if (indexPath.row == 6) {
            // push past history
            [segueName setString:@"toMedHistory"];
        } else {
            // push family history
            [segueName setString:@"toFamilyHistory"];
        }
        [delegate selectedCellWithInfo:segueName];
    }
    
    
    //NSIndexPath* dateIndexPath = [NSIndexPath indexPathForItem:expandedCellIndex inSection:0];
    //NSLog(@":: %d", (((DateCell*)[self.tableView cellForRowAtIndexPath:dateIndexPath]).datePicker).isHidden);
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



@end
