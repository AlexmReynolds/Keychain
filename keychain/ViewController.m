//
//  ViewController.m
//  keychain
//
//  Created by Alex Reynolds on 1/2/14.
//  Copyright (c) 2014 Alex Reynolds. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *valueField;

@property (weak, nonatomic) IBOutlet UITextField *keyField;
@end

static NSString *KeychainUID = @"KeychainUID";
static NSString *KeychainKey = @"KeychainKey";
static NSString *KeychainValue = @"KeychainValue";
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
    [KeychainManager save:KeychainUID data:@{KeychainKey:self.keyField.text,KeychainValue:self.valueField.text}];
    UIAlertView *save = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"Saved to keychain" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [save show];
    self.keyField.text = @"";
    self.valueField.text = @"";
}

- (IBAction)load:(id)sender {
    NSDictionary *dict = [KeychainManager load:KeychainUID];
    self.keyField.text = [dict valueForKey:KeychainKey];
    self.valueField.text = [dict valueForKey:KeychainValue];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger nextTag = textField.tag + 1;

    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO;
}

@end
