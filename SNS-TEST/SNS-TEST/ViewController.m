//
//  ViewController.m
//  SNS-TEST
//
//  Created by Karthik Yalamanchili on 4/16/17.
//  Copyright © 2017 Karthik Yalamanchili. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "AcronymParser.h"
#import "MBProgressHUD.h"


@interface ViewController ()

@property (nonatomic,strong) NSString *searchText;
@property (nonatomic,strong) NSArray * listArray;
@end

@implementation ViewController

static NSString * const BaseURLString = @"http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchTextFeild.delegate = self;
    
    // Adding the gesture recognozer to the view helps to
    //dismiss the keyboard by tapping anywhere on the screen
    //other than textfeild
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - IBAction
- (IBAction)fetchResultsForTheEntry:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self dismissKeyboard];
    
    // Text from the textfeild is set to the searchstring
    _searchText = _searchTextFeild.text;
    NSLog(@"text is %@", _searchText);
    
    NSString * fullRequestString = [NSString stringWithFormat:@"%@%@", BaseURLString,_searchText];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:fullRequestString  parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        if([responseObject isKindOfClass:[NSArray class]]){
            if([(NSArray *)responseObject count] == 1){
                
                NSDictionary *acronymDict = [(NSArray *)responseObject lastObject];
                if([[acronymDict objectForKey:@"sf"] compare:_searchText options:NSCaseInsensitiveSearch] == NSOrderedSame){
                    
                    _listArray = [AcronymParser parseAcronymResponse:(NSArray *)[acronymDict objectForKey:@"lfs"]];
                    AcronymDataModel * adm = [[AcronymDataModel alloc] init];
                    adm.searchTerm = _searchText;
                    
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    
                    [self performSegueWithIdentifier:@"acronymResultList" sender:nil];
                }
                else{
                    
                    [self showErrorMessage];
                    
                }
            }
            else{
                
                [self showErrorMessage];
            }
        }
        else{
            [self showErrorMessage];
        }
        
        NSLog(@"JSON: %@", responseObject);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        [self showMessage:@" Serivce Failure Check Internet Connection "
                withTitle:@"Alert"];
        
        NSLog(@"Error: %@", error);
    }];
    
    
}
# pragma mark - custom methods
-(void)showErrorMessage{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [self showMessage:@" There is no record available for this  acronym"
            withTitle:@"Error"];
}

-(void)dismissKeyboard
{
    [_searchTextFeild resignFirstResponder];
}

# pragma mark - Alert
-(void)showMessage:(NSString*)message withTitle:(NSString *)title
{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //do something when click button
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Textfeild delegate methods
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    _searchText = _searchTextFeild.text;
    NSLog(@"text is %@", _searchText);
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender{
    if([segue.destinationViewController isKindOfClass:[ListViewController class]]){
        ListViewController *listController = (ListViewController *)segue.destinationViewController;
        [listController setListOfDescriptions:_listArray];
    }
    
}



@end
