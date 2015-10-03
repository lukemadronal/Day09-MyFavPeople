//
//  Phone+CoreDataProperties.h
//  iFav
//
//  Created by Luke Madronal on 10/1/15.
//  Copyright © 2015 Luke Madronal. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Phone.h"

NS_ASSUME_NONNULL_BEGIN

@interface Phone (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *number;
@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) Persons *relationshipPhonestoPerson;

@end

NS_ASSUME_NONNULL_END
