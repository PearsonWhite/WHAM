//
//  GeneratedReportViewController.h
//  WHAM
//
//  Created by Pearson White on 4/21/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneratedReportViewController : UIViewController

typedef enum GeneratedType { GeneratedPap, GeneratedMammo } GeneratedType;
typedef enum GeneratedSuggestion { GeneratedSuggestionNextExam, GeneratedSuggestionTalkToDoctor, GeneratedSuggestionDiscontinue, GeneratedSuggestionNone } GeneratedSuggestion;

@property (nonatomic, assign) GeneratedType generatedType;

@property (strong, nonatomic) IBOutlet UILabel* labelGeneratedReport;



@end
