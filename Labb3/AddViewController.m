//
//  AddViewController.m
//  Labb3
//
//  Created by IT-Högskolan on 2015-02-09.
//  Copyright (c) 2015 IT-Högskolan. All rights reserved.
//

#import "AddViewController.h"
#import "Task.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addItemName;
@property (weak, nonatomic) IBOutlet UISwitch *importantSwitch;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(id)sender {
    
    [self.items addObject:[[Task alloc] initWithName:self.addItemName.text important:self.importantSwitch.isOn]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
