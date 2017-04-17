//
//  ListViewController.h
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import "ViewController.h"
#import "AcronymDataModel.h"
#import "ListCellTableViewCell.h"

@interface ListViewController : UIViewController
@property (nonatomic,strong) AcronymDataModel * listaData;
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (nonatomic,strong) NSArray *listOfDescriptions;


@end
