//
//  GeneratedReportViewController.h
//  WHAM
//
//  Created by Pearson White on 4/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneratedReportViewController : UIViewController

typedef enum { GeneratedPap, GeneratedMammo } GeneratedType;

@property (nonatomic, assign) GeneratedType generatedType;

@property NSDate* birthday;
@property bool abnormal;
@property bool history_hpv;

@end
