//
//  ViewController.h
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "AcronymParser.h"
#import "AcronymDataModel.h"


@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextFeild;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

- (IBAction)fetchResultsForTheEntry:(id)sender;

@end

