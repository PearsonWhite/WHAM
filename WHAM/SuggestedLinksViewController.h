//
//  SuggestedLinksViewController.h
//  WHAM
//
//  Created by Pearson White on 4/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

// @interface SuggestedLinksViewController : UIViewController

@interface SuggestedLinksViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *TableViewObject;


@end
