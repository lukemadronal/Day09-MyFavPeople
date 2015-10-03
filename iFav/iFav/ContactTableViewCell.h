//
//  ContactTableViewCell.h
//  iFav
//
//  Created by Luke Madronal on 10/1/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Persons.h"

@interface ContactTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel    *personCell;
@property(nonatomic, weak) IBOutlet UITextField *firstNameTextField;

@end
