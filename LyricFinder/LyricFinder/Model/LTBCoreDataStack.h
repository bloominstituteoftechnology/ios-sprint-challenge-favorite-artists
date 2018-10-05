//
//  LTBCoreDataStack.h
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTBCoreDataStack : NSObject

@property (class, nonatomic, readonly) LTBCoreDataStack *sharedStack;

@property (nonatomic, readonly) NSManagedObjectContext *mainContext;

@property (nonatomic, readonly) NSPersistentContainer *container;

- (void)save;

- (void)saveWithContext:(NSManagedObjectContext *)moc error:(NSError **)error;


@end

NS_ASSUME_NONNULL_END
