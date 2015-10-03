//
//  DetailViewController.h
//  iFav
//
//  Created by Luke Madronal on 10/1/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Persons.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) Persons *currentPerson;

@end
