//
//  ListCellTableViewCell.h
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AcronymDataModel.h"

@interface ListCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *acronymLabel;

-(void) constructCellForRow:(AcronymDataModel *)dataSourceModel ;

@end
