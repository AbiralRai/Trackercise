//
//  TableViewController.m
//  Trackercise
//
//  Created by Abiral Rai on 13/5/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeTableViewCell.h"
#import "DetailViewController.h"
#import "Plist.h"

@interface HomeTableViewController () <UIAlertViewDelegate>

@end

@implementation HomeTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.ref = [[FIRDatabase database] reference];
    
//    NSArray *test = @[@"Program 1",@"Program 2"];
   
    
    [self getData];
    
//    [[_ref child:@"Programs"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//
//        __block NSMutableArray *tempTitle;
//
//        NSDictionary *dict = snapshot.value;
//        NSArray *allValue = [dict allValues];
//        NSArray *programTitle = [allValue valueForKey:@"name"];
//        id programDuration = [allValue valueForKey:@"duration"];
//        NSLog(@"ALL VALUE%@", allValue);
//        NSLog(@"NAme %@", programTitle);
//        NSLog(@"Type %@", [programTitle class]);
//
//        tempTitle = [programTitle mutableCopy];
//
////    }];
//
//    getTitle = [NSMutableArray arrayWithArray:test];
//    getDuration = [NSMutableArray arrayWithArray:@[@"3Days/Week",@"4Days/Week"]];
//
////
//    title = [[NSMutableArray alloc] initWithArray:getTitle];
//    duration = [[NSMutableArray alloc] initWithArray:getDuration];
//    NSLog(@"Duration %@", [duration class]);
//
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewProgram:)];
    
    
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    
}

-(void) getData {
    _ref = [[FIRDatabase database] reference];
    
    [[_ref child:@"Programs"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
            NSDictionary *dict = snapshot.value;
            NSArray *allValue = [dict allValues];
        self->programTitle = [allValue valueForKey:@"name"];
        self->programDuration = [allValue valueForKey:@"duration"];
        
//        NSLog(@"NAme %@", self->programTitle);
        
        [self showData];
    }];
}

-(void) showData {
    
    getTitle = [NSMutableArray arrayWithArray:programTitle];
    getDuration = [NSMutableArray arrayWithArray:programDuration];
//    NSLog(@"Show data %@", getTitle);
    
    //    getTitle = [NSMutableArray arrayWithArray:test];
    //    getDuration = [NSMutableArray arrayWithArray:@[@"3Days/Week",@"4Days/Week"]];
    
    title = [[NSMutableArray alloc] initWithArray:getTitle];
    duration = [[NSMutableArray alloc] initWithArray:getDuration];
    
    NSLog(@"Type of title %@", [title class]);
    
    [self.tableView reloadData];
    
    
}

#pragma mark - Adding Programs

- (void)addNewProgram:(UIBarButtonItem *)sender {
    
    UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"New Program" message:@"Input Program name and Duration" preferredStyle:UIAlertControllerStyleAlert];
    
    //Program name textfield
    [alertcontroller addTextFieldWithConfigurationHandler:^(UITextField *textfield)
     {
         textfield.placeholder = @"Program Name";
         textfield.textColor = [UIColor colorWithRed:52.0/255.0 green:168.0/255.0 blue:83.0/255.0 alpha:1.0];
         textfield.borderStyle = UITextBorderStyleRoundedRect;
         textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
     }
     ];
    
    //Duration textfield
    [alertcontroller addTextFieldWithConfigurationHandler:^(UITextField *textfield)
     {
         textfield.placeholder = @"Duration";
         textfield.textColor = [UIColor colorWithRed:52.0/255.0 green:168.0/255.0 blue:83.0/255.0 alpha:1.0];
         textfield.borderStyle = UITextBorderStyleRoundedRect;
         textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
     }
     ];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //button click event
        
        NSArray *textfields = alertcontroller.textFields;
        UITextField *titleInput = textfields[0];
        UITextField *durationInput = textfields[1];
        
        NSDictionary *program = [NSDictionary dictionaryWithObjectsAndKeys:
                                 titleInput.text, @"name",
                                 durationInput.text, @"duration",
                                 nil];
        //Root node
        FIRDatabaseReference *programReference = [self.ref child: @"Programs"];
        
        //Random ID for each child node of Programs
        FIRDatabaseReference *newProgramReference = [programReference childByAutoId];
        
        [newProgramReference setValue: program];
        

        [self->title addObject:titleInput.text];
        [self->duration addObject:durationInput.text];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self->title.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertcontroller addAction:cancel];
    [alertcontroller addAction:ok];
    [self presentViewController:alertcontroller animated:YES completion:nil];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return title.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];

    // Configure the cell...
    UIFont *myFont = [ UIFont fontWithName: @"Avenir Next Bold " size: 30.0 ];
    cell.textLabel.font  = myFont;
    cell.cellTitle.text = title[indexPath.row];
    cell.cellDuration.text = duration[indexPath.row];

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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        DetailViewController *detailView = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        int row = (int)[myIndexPath row];
        detailView.detailModal = @[title[row], duration[row]];
        
    }
    
    
}


@end
