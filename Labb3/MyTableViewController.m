//
//  MyTableViewController.m
//  Labb3
//
//  Created by IT-Högskolan on 2015-02-09.
//  Copyright (c) 2015 IT-Högskolan. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyDetailViewController.h"
#import "AddViewController.h"
#import "Task.h"

@interface MyTableViewController ()

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) Task *currentTask;

@end

@implementation MyTableViewController

- (NSMutableArray*)items {
    if (!_items) {
        _items = [@[[[Task alloc] initWithName:@"Do homework" important:NO], [[Task alloc] initWithName:@"Do the washing up" important:NO], [[Task alloc] initWithName:@"Call grandma" important:NO]] mutableCopy];
    }
    return _items;
}


- (void)viewWillDisappear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.items];
    [defaults setObject:data forKey:@"items"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"items"];
    self.items = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    
    Task* task = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = task.name;
    if (task.important) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    self.currentTask = [self.items objectAtIndex:indexPath.row];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Detail"]) {
        
        MyDetailViewController *detailView = [segue destinationViewController];
        UITableViewCell *cell = sender;
        
        detailView.title = cell.textLabel.text;
        detailView.items = self.items;
        detailView.currentTask = self.currentTask;
    }
    else if ([segue.identifier isEqualToString:@"Add"]) {
        AddViewController *addView = [segue destinationViewController];
        
        addView.items = self.items;
    }
    else {
        NSLog(@"You forgot the segue %@", segue);
    }
    
}


@end
