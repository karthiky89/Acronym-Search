//
//  ListViewController.m
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController
@synthesize listOfDescriptions;

#pragma mark - LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Results";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - TableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
    
    NSLog(@"cell number %ld",indexPath.row);
    // Configure the cell...
    [cell constructCellForRow:(AcronymDataModel *)[self.listOfDescriptions objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listOfDescriptions.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(((AcronymDataModel *)[self.listOfDescriptions objectAtIndex:indexPath.row]).variations.count > 0){
        [self performSegueWithIdentifier:@"detailSegue" sender:indexPath];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender{
    if([segue.destinationViewController isKindOfClass:[DetailViewController class]]){
        DetailViewController *detailsCntlr = (DetailViewController *)segue.destinationViewController;
        
        detailsCntlr.listOfVariations = ((AcronymDataModel *)[ self.listOfDescriptions objectAtIndex:((NSIndexPath *)sender).row]).variations;
    }
    
}



@end
