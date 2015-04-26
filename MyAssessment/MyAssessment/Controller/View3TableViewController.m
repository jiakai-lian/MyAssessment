//
//  View3TableViewController.m
//  MyAssessment
//
//  Created by jiakai lian on 27/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "View3TableViewController.h"

static NSUInteger const NUMBER_OF_DAYS = 12;
static NSString const *DATETIME_FORMAT = @"dd' 'MMMM' 'yyyy";

@interface View3TableViewController ()

@property (nonatomic, copy) NSDateFormatter * dateFormatter;
@property (nonatomic, copy) NSCalendar * calender;
@end

@implementation View3TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
                  
- (NSDateFormatter*)dateFormatter
{
    //lazy init
    if(!_dateFormatter)
    {
       _dateFormatter = [[NSDateFormatter alloc] init];
       [_dateFormatter setDateFormat:DATETIME_FORMAT.copy];
    }
    return _dateFormatter;
}

- (NSCalendar*)calender
{
    //lazy init
    if(!_calender)
    {
        _calender = [NSCalendar currentCalendar];
    }
    return _calender;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return NUMBER_OF_DAYS;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const CELL_ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = [self.dateFormatter stringFromDate: [self.calender dateByAddingComponents:components toDate:[NSDate new] options:0]];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
