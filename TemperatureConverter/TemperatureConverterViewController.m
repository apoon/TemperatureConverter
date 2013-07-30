//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Aaron Poon on 7/29/13.
//  Copyright (c) 2013 Aaron Poon. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()

@property BOOL lastEditedFahrenheit;

- (void)updateLastEdited;
- (void)updateTemperature;

@end

@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fahrenheitTextField.delegate = self;
    self.celsiusTextField.delegate = self;
    
    [self.fahrenheitTextField addTarget:self action:@selector(updateLastEdited) forControlEvents:UIControlEventEditingDidBegin];
    [self.celsiusTextField addTarget:self action:@selector(updateLastEdited) forControlEvents:UIControlEventEditingDidBegin];
    
    [self.convertButton addTarget:self action:@selector(updateTemperature) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    
    return YES;
}

#pragma mark - private methods

- (void)updateLastEdited {
    if(self.fahrenheitTextField.isEditing) {
        self.lastEditedFahrenheit = true;
    }
    else {
        self.lastEditedFahrenheit = false;
    }
}

- (void)updateTemperature {
    if(self.lastEditedFahrenheit) {
        float fahrenheit = [self.fahrenheitTextField.text floatValue];
        float celsius = (fahrenheit - 32) * (5.0 / 9);
        
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f", celsius];
    }
    else {
        float celsius = [self.celsiusTextField.text floatValue];
        float fahrenheit = celsius * (9.0 / 5) + 32;
    
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", fahrenheit];
    }
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

@end
