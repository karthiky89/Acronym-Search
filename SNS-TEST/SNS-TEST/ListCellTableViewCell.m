//
//  ListCellTableViewCell.m
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import "ListCellTableViewCell.h"


@implementation ListCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Configuration methods

-(void) constructCellForRow:(AcronymDataModel *)dataSourceModel {
    
    if(dataSourceModel.variations == 0){
        self.accessoryType = UITableViewCellAccessoryNone;
    }else{
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    self.acronymLabel.text = dataSourceModel.longDescription;
}

@end
