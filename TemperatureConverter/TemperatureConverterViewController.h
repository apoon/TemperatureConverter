//
//  TemperatureConverterViewController.h
//  TemperatureConverter
//
//  Created by Aaron Poon on 7/29/13.
//  Copyright (c) 2013 Aaron Poon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureConverterViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic, strong) IBOutlet UITextField *celsiusTextField;
@property (nonatomic, strong) IBOutlet UIButton *convertButton;

- (IBAction)dismissKeyboard;

@end
