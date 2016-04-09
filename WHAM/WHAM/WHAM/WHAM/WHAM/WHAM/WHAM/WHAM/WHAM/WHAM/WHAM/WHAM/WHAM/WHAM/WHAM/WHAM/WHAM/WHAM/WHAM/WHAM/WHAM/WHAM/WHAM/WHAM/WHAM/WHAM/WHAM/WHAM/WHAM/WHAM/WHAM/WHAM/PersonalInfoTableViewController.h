//
//  PersonalInfoTableViewController.h
//  WHAM
//
//  Created by Pearson White on 3/5/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTableDelegate <NSObject>
@required
- (void)selectedCellWithInfo:(NSString *)segueName;
@end


@interface PersonalInfoTableViewController : UITableViewController

@property (strong) id delegate;

//@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property int expandedCellIndex;
//#define DATE_CELL_HEIGHT 219
@property int dateCellHeight;

@end
