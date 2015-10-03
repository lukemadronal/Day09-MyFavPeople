//
//  DetailViewController.m
//  iFav
//
//  Created by Luke Madronal on 10/1/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "ContactTableViewCell.h"
#import "Persons.h"

@interface DetailViewController ()

@property (nonatomic, strong) AppDelegate               *appDelegate;
@property (nonatomic, strong) NSManagedObjectContext    *managedObjectContext;
@property(nonatomic, weak) IBOutlet UITextField         *firstNameTextField;
@property (nonatomic,weak) IBOutlet UITableView         *detailTableView;
@property (nonatomic,strong) NSArray                    *tableViewCellList;

@end

@implementation DetailViewController

#pragma mark - TableView Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    _tableViewCellList = [[NSArray alloc] init];
    _tableViewCellList=@[@"Name: "];
    return _tableViewCellList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    ContactTableViewCell *contactCell = (ContactTableViewCell *) [_detailTableView dequeueReusableCellWithIdentifier:@"firstNameCell" ];
    NSString *cellLabel = _tableViewCellList[indexPath.row];
    contactCell.textLabel.text= cellLabel;
    return contactCell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

#pragma mark - Interactivity Methods

-(void)saveAndPop {
    [_appDelegate saveContext];
    [self.navigationController popToRootViewControllerAnimated:true];
}

-(IBAction)saveButtonPressed:(id)sender{
    ContactTableViewCell *labelCell = (ContactTableViewCell *) [_detailTableView dequeueReusableCellWithIdentifier:@"firstNameCell"];
    _currentPerson.firstName = labelCell.firstNameTextField.text;
//    _currentPerson.dateUpdated = [NSDate date];
//    _currentPerson.userID = @"User";
    [self saveAndPop];
}

-(IBAction)deleteRecord:(id)sender {
//    NSLog(@"Delete");
//    [_managedObjectContext deleteObject:_currentTimer];
//    [self saveAndPop];
//    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_currentPerson != nil) {
    ContactTableViewCell *labelCell = (ContactTableViewCell *) [_detailTableView dequeueReusableCellWithIdentifier:@"firstNameCell"];
        labelCell.firstNameTextField.text = _currentPerson.firstName;
    } else {
        Persons *newPerson = (Persons *)[NSEntityDescription insertNewObjectForEntityForName:@"Persons" inManagedObjectContext:_managedObjectContext];
        _currentPerson = newPerson;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
