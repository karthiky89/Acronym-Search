//
//  AcronymParser.m
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import "AcronymParser.h"
#import "AcronymDataModel.h"
@implementation AcronymParser

+(NSMutableArray *)parseAcronymResponse:(NSArray *)responseArray{
    
    
    NSMutableArray *longForms = [NSMutableArray array];
    
    for(NSDictionary *lfDict in responseArray){
        
        AcronymDataModel *modelObj = [[AcronymDataModel alloc] init];
        
        [modelObj setFrequency:[[lfDict valueForKey:@"freq"] integerValue]];
        [modelObj setYearOfFirstUse:[[lfDict valueForKey:@"since"] integerValue]];
        [modelObj setLongDescription:[lfDict valueForKey:@"lf"]];
        
        NSMutableArray *variations = [NSMutableArray array];
        
        if([[lfDict allKeys] containsObject:@"vars"]){
            for(NSDictionary *variationDict in [lfDict valueForKey:@"vars"]){
                AcronymDataModel * varObj = [[AcronymDataModel alloc] init];
                [varObj setFrequency:[[variationDict valueForKey:@"freq"] integerValue]];
                [varObj setYearOfFirstUse:[[variationDict valueForKey:@"since"] integerValue]];
                [varObj setLongDescription:[variationDict valueForKey:@"lf"]];
                
                [variations addObject:varObj];
            }
        }
        [modelObj setVariations:variations];
        
        [longForms addObject:modelObj];
    }
    
    
    return longForms;
    
}

@end
