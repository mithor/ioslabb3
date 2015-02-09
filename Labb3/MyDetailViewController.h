//
//  MyDetailViewController.h
//  Labb3
//
//  Created by IT-Högskolan on 2015-02-09.
//  Copyright (c) 2015 IT-Högskolan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface MyDetailViewController : UIViewController

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) Task *currentTask;

@end
