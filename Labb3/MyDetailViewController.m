//
//  MyDetailViewController.m
//  Labb3
//
//  Created by IT-Högskolan on 2015-02-09.
//  Copyright (c) 2015 IT-Högskolan. All rights reserved.
//

#import "MyDetailViewController.h"

@interface MyDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *importantLabel;

@end

@implementation MyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemNameLabel.text = self.currentTask.name;
    if (self.currentTask.important) {
        self.importantLabel.text = @"Important!";
    } else {
        self.importantLabel.text = @"";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)deleteButtonPressed:(id)sender {
    
    [self.items removeObject:self.currentTask];
    
    [self.navigationController popToRootViewControllerAnimated:YES ];
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
