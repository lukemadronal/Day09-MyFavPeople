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
@property (nonatomic,strong     ) IBOutlet UITableView         *detailTableView;
@property (nonatomic,strong) NSArray                        *tableViewCellList;

@end

@implementation DetailViewController

#pragma mark - TableView Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableViewCellList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    ContactTableViewCell *contactCell = (ContactTableViewCell *) [_detailTableView dequeueReusableCellWithIdentifier:@"ContactCell" ];
    NSString *cellLabel = _tableViewCellList[indexPath.row];
    contactCell.cellLabel.text= cellLabel;
    return contactCell;
}

//if (indexPath.row > 2 ) {
//    UITableViewCell *basicCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BasicCell"];
//    Timers *currentTime = _timerArray[indexPath.row];
//    basicCell.textLabel.text = currentTime.timerName;
//    return basicCell;
//} else {
//    
//    LabelCenterTableViewCell *labelCell = (LabelCenterTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"CenterLabelCell"];
//    Timers *currentTime = _timerArray[indexPath.row];
//    labelCell.cellLabel.text= currentTime.timerName;
//    labelCell.cellSwitch.on=false;
//    return labelCell;
//}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 109.0;
}

#pragma mark - Interactivity Methods

-(void)saveAndPop {
    [_appDelegate saveContext];
    [self.navigationController popToRootViewControllerAnimated:true];
}

-(IBAction)saveButtonPressed:(id)sender{
    NSIndexPath *pathZero = [NSIndexPath indexPathForRow:0 inSection:0];
    ContactTableViewCell *labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    _currentPerson.firstName = labelCell.cellTextField.text;
    
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
    _tableViewCellList = @[@"First Name;",@"Last Name:"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_currentPerson != nil) {
        
    } else {
        Persons *newPerson = (Persons *)[NSEntityDescription insertNewObjectForEntityForName:@"Persons" inManagedObjectContext:_managedObjectContext];
        _currentPerson = newPerson;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
