//
//  DetailViewController.h
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/17/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import "ViewController.h"
#import "AcronymDataModel.h"

@interface DetailViewController : ViewController
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (nonatomic,strong) NSArray *listOfVariations;
@property (nonatomic,strong) AcronymDataModel * detailData;


@end
