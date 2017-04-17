//
//  DetailViewController.m
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/17/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize listOfVariations;

#pragma mark - LifeCycle Methods
- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.title = @"Variations";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Tableview Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listOfVariations.count;
    
}

- ( UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
    
}
- ( UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
    
    AcronymDataModel *variation = [self.listOfVariations objectAtIndex:indexPath.section];
    if(indexPath.row == 0){
        
        
        [cell.textLabel setText:@""];
        [cell.detailTextLabel setText:variation.longDescription];
        
    }
    else if(indexPath.row == 1){
        [cell.textLabel setText:@"Frequency"];
        [cell.detailTextLabel setText: [NSString stringWithFormat: @"%ld", (long)variation.frequency]];
    } else if (indexPath.row == 2){
        [cell.textLabel setText:@"Since"];
        [cell.detailTextLabel setText: [NSString stringWithFormat: @"%ld", (long)variation.yearOfFirstUse]];
    }
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
