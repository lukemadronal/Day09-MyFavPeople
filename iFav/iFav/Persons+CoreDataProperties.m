//
//  Persons+CoreDataProperties.m
//  iFav
//
//  Created by Luke Madronal on 10/1/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Persons+CoreDataProperties.h"

@implementation Persons (CoreDataProperties)

@dynamic category;
@dynamic imageName;
@dynamic firstName;
@dynamic lastName;
@dynamic role;
@dynamic skypeName;
@dynamic twitterName;
@dynamic addressStreet;
@dynamic addressState;
@dynamic addressZip;
@dynamic email;
@dynamic emailType;
@dynamic relationshipPersontoPhones;

@end
