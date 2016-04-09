//
//  constants.h
//  WHAM
//
//  Created by Pearson White on 3/6/16.
//  Copyright (c) 2016 UNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface constants : NSObject

FOUNDATION_EXPORT NSString *const KEY_HISTORY_HPV;
FOUNDATION_EXPORT NSString *const KEY_HPV_VACCINATED;
FOUNDATION_EXPORT NSString *const KEY_HAD_HISTERECTOMY;
FOUNDATION_EXPORT NSString *const KEY_HISTERECTOMY_FOR_CANCER;

FOUNDATION_EXPORT NSString *const KEY_FAMILY_HISTORY_CANCER;
FOUNDATION_EXPORT NSString *const KEY_MOTHER_CANCER;
FOUNDATION_EXPORT NSString *const KEY_SISTER_CANCER;
FOUNDATION_EXPORT NSString *const KEY_DAUGHTER_CANCER;

// use number as a bool when setting/getting
FOUNDATION_EXPORT NSString *const KEY_SMOKES;

FOUNDATION_EXPORT NSString *const KEY_BIRTH_DATE;
FOUNDATION_EXPORT NSString *const KEY_LAST_MAMMO_DATE;
FOUNDATION_EXPORT NSString *const KEY_LAST_PAP_DATE;

@end
