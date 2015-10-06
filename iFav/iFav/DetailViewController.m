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
    if (indexPath.row == 0)
        contactCell.prevCellLabel.text = _currentPerson.firstName;
    if (indexPath.row == 1)
        contactCell.prevCellLabel.text = _currentPerson.lastName;
    if (indexPath.row == 2)
        contactCell.prevCellLabel.text = _currentPerson.skypeName;
    if (indexPath.row == 3)
        contactCell.prevCellLabel.text = _currentPerson.twitterName;
    if (indexPath.row == 4)
        contactCell.prevCellLabel.text = _currentPerson.addressStreet;
    if (indexPath.row == 5)
        contactCell.prevCellLabel.text = _currentPerson.addressState;
    if (indexPath.row == 6)
        contactCell.prevCellLabel.text = _currentPerson.addressZip;
    if (indexPath.row == 7)
        contactCell.prevCellLabel.text = _currentPerson.email;
    if (indexPath.row == 8)
        contactCell.prevCellLabel.text = _currentPerson.emailType;
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
    //first Name
    NSIndexPath *pathZero = [NSIndexPath indexPathForRow:0 inSection:0];
    ContactTableViewCell *labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.firstName;
    } else {
        _currentPerson.firstName = labelCell.cellTextField.text;
    }
    //Last Name
    pathZero = [NSIndexPath indexPathForRow:1 inSection:0];
    labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.lastName;
    } else {
        _currentPerson.lastName = labelCell.cellTextField.text;
    }
    //Skype Name
    pathZero = [NSIndexPath indexPathForRow:2 inSection:0];
    labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.skypeName;
    } else {
        _currentPerson.skypeName = labelCell.cellTextField.text;
    }
    //Twitter Name
    pathZero = [NSIndexPath indexPathForRow:3 inSection:0];
    labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.twitterName;
    } else {
        _currentPerson.twitterName = labelCell.cellTextField.text;
    }
    //
    pathZero = [NSIndexPath indexPathForRow:4 inSection:0];
    labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.addressStreet;
    } else {
        _currentPerson.addressStreet = labelCell.cellTextField.text;
    }
    
    pathZero = [NSIndexPath indexPathForRow:5 inSection:0];
    labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.addressState;
    } else {
        _currentPerson.addressState = labelCell.cellTextField.text;
    }
    
    pathZero = [NSIndexPath indexPathForRow:6 inSection:0];
    labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.addressZip;
    } else {
        _currentPerson.addressZip = labelCell.cellTextField.text;
    }
    
    pathZero = [NSIndexPath indexPathForRow:7 inSection:0];
    labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.email;
    } else {
        _currentPerson.email = labelCell.cellTextField.text;
    }
    pathZero = [NSIndexPath indexPathForRow:8 inSection:0];
    labelCell = (ContactTableViewCell *) [_detailTableView cellForRowAtIndexPath:pathZero];
    if ([labelCell.cellTextField.text isEqualToString:@""]) {
        labelCell.cellLabel.text = _currentPerson.emailType;
    } else {
        _currentPerson.emailType = labelCell.cellTextField.text;
    }





//    _currentPerson.dateUpdated = [NSDate date];
//    _currentPerson.userID = @"User";
    [self saveAndPop];
}

-(IBAction)deleteRecord:(id)sender {
    //NSLog(@"Delete");
    [_managedObjectContext deleteObject:_currentPerson];
    [self saveAndPop];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = _appDelegate.managedObjectContext;
//    @dynamic category;
//    @dynamic imageName;
//    @dynamic firstName;
//    @dynamic lastName;
//    @dynamic role;
//    @dynamic skypeName;
//    @dynamic twitterName;
//    @dynamic addressStreet;
//    @dynamic addressState;
//    @dynamic addressZip;
//    @dynamic email;
//    @dynamic emailType;
//    @dynamic relationshipPersontoPhones;

    _tableViewCellList = @[@"First Name;",@"Last Name:", @"Skype Name:",@"Twitter Name",@"Street Adress", @"City,State", @"Zip Code",@"Email Adress:",@"Email Type"];
    
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
