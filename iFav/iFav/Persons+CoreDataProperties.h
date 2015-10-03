//
//  Persons+CoreDataProperties.h
//  iFav
//
//  Created by Luke Madronal on 10/1/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Persons.h"

NS_ASSUME_NONNULL_BEGIN

@interface Persons (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *category;
@property (nullable, nonatomic, retain) NSString *imageName;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *role;
@property (nullable, nonatomic, retain) NSString *skypeName;
@property (nullable, nonatomic, retain) NSString *twitterName;
@property (nullable, nonatomic, retain) NSString *addressStreet;
@property (nullable, nonatomic, retain) NSString *addressState;
@property (nullable, nonatomic, retain) NSString *addressZip;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *emailType;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *relationshipPersontoPhones;

@end

@interface Persons (CoreDataGeneratedAccessors)

- (void)addRelationshipPersontoPhonesObject:(NSManagedObject *)value;
- (void)removeRelationshipPersontoPhonesObject:(NSManagedObject *)value;
- (void)addRelationshipPersontoPhones:(NSSet<NSManagedObject *> *)values;
- (void)removeRelationshipPersontoPhones:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
