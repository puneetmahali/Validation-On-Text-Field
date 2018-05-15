//
//  SignUpViewController.m
//  TextFieldValidations
//
//  Created by Puneet Mahali on 14/05/18.
//  Copyright © 2018 Puneet Mahali. All rights reserved.
//

#import "SignUpViewController.h"
#import "TextFieldValidator.h"
#import "SignInViewController.h"
#import "HomeViewController.h"

#define REGEX_USER_NAME_LIMIT @"^.{3,10}$"
#define REGEX_USER_NAME @"[A-Za-z0-9]{3,10}"
#define REGEX_EMAIL @"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define REGEX_PASSWORD_LIMIT @"^.{6,20}$"
#define REGEX_PASSWORD @"[A-Za-z0-9]{6,20}"
#define REGEX_PHONE_DEFAULT @"[0-9]{3}\\-[0-9]{3}\\-[0-9]{4}"

@interface SignUpViewController ()<UITextFieldDelegate>
{
    IBOutlet TextFieldValidator *txtusername;
    IBOutlet TextFieldValidator *txtpassword;
    IBOutlet TextFieldValidator *txtcnfrmpassword;
    IBOutlet TextFieldValidator *txtemail;
    IBOutlet TextFieldValidator *txtphone;
}

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self setup];
}

-(void)setup
{
    [txtusername addRegx:REGEX_USER_NAME_LIMIT withMsg:@"User name charaters limit should be come between 3-10"];
    [txtusername addRegx:REGEX_USER_NAME withMsg:@"Only alpha numeric characters are allowed."];
    [txtemail addRegx:REGEX_EMAIL withMsg:@"Enter valid email"];
    [txtpassword addRegx:REGEX_PASSWORD_LIMIT withMsg:@"Password characters limit should be come between 6-20"];
    [txtpassword addRegx:REGEX_PASSWORD withMsg:@"Password must contain alpha numeric characters."];
    [txtpassword addConfirmValidationTo:txtpassword withMsg:@"Confirm password didn’t match."];
    [txtphone addRegx:REGEX_PHONE_DEFAULT withMsg:@"Phone number must be in proper format (eg. ###-###-####)"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onSignUp:(id)sender
{
    if ([txtusername validate] & [txtemail validate] & [txtpassword validate] & [txtcnfrmpassword validate] & [txtphone validate])
    {
        HomeViewController *Home = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
        [self.navigationController pushViewController:Home animated:true];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
