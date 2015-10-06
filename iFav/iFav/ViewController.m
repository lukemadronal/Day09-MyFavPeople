//
//  ViewController.m
//  iFav
//
//  Created by Luke Madronal on 10/1/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "ContactTableViewCell.h"
#import "Persons.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray                    *personsList;
@property (nonatomic, strong) AppDelegate               *appDelegate;
@property (nonatomic, strong) NSManagedObjectContext    *managedObjectContext;


@end

@implementation ViewController



#pragma mark - TableView Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _personsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *contactCell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"personsCell"];
    Persons *testPersonBob = _personsList[indexPath.row];
    contactCell.textLabel.text= testPersonBob.firstName;
    contactCell.detailTextLabel.text = testPersonBob.lastName;
    //NSLog(@"%@",testPersonBob);
    return contactCell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
           return 43.5;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //NSLog(@"Going to delete %li",indexPath.row);
        Persons *personToDelete = _personsList[indexPath.row];
        [_managedObjectContext deleteObject:personToDelete];
        [_appDelegate saveContext];
        _personsList = [self fetchTimers];
        [_personsTableView reloadData];
        
        
        
    }
}

#pragma mark - Core Data Methods



#pragma mark - Interactivity Methods

- (NSArray *)fetchTimers {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Persons" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptorName = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:true];
    NSArray *sortDescriptors = @[sortDescriptorName];
    [fetchRequest setSortDescriptors:sortDescriptors];
    //    if (_timerSearchBar.text.length > 0 && !_timerSearchBar.hidden) {
    //        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"timerName contains[cd] %@",_timerSearchBar.text];
    //        [fetchRequest setPredicate:predicate];
    //    }
    NSArray *fetchResults = [_managedObjectContext executeFetchRequest:fetchRequest error: nil];
    return fetchResults;
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *destController = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"segueEditPerson"]) {
        NSIndexPath *indexPath = [_personsTableView indexPathForSelectedRow];
        Persons *currentPerson = _personsList[indexPath.row];
        destController.currentPerson = currentPerson;
        
    } else if ([[segue identifier] isEqualToString:@"segueAddPerson"]) {
        destController.currentPerson = nil;
        
        
    }
}

#pragma mark - Life Cycle Methods


- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
    
    _personsList = [[NSMutableArray alloc] init];
    
}

- (void)viewWillAppear:(BOOL)animated   {
    [super viewWillAppear:animated];
    //[_personsList addObject:personToAdd];
    _personsList = [self fetchTimers];
    //NSLog(@"Count:%li",_personsList.count);
    [_personsTableView reloadData];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
