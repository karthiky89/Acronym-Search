//
//  AcronymParser.h
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AcronymParser : NSObject

+(NSMutableArray *)parseAcronymResponse:(NSArray *)responseArray;

@end
