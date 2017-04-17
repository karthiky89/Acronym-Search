//
//  AcronymDataModel.h
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcronymDataModel : NSObject

@property (nonatomic,strong) NSString* longDescription;
@property (nonatomic,assign) NSInteger  frequency;
@property (nonatomic,strong) NSMutableArray * variations;
@property (nonatomic,assign) NSInteger  yearOfFirstUse;
@property (nonatomic,strong) NSString * searchTerm;

@end
