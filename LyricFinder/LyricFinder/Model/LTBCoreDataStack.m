//
//  LTBCoreDataStack.m
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBCoreDataStack.h"

@implementation LTBCoreDataStack

+ (LTBCoreDataStack *)sharedStack
{
    static LTBCoreDataStack *sharedStack;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStack = [[LTBCoreDataStack alloc] init];
    });
    
    return sharedStack;
}

- (NSManagedObjectContext *)mainContext
{
    return self.container.viewContext;
}

@synthesize container = _container;

- (NSPersistentContainer *)container
{
    if (!_container) {
        _container = [[NSPersistentContainer alloc] initWithName:@"LTBLyric"];
        [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *persistentDescription, NSError *error) {
            if (error) {
                NSLog(@"Failed to load Core Data stack: %@", error);
                abort();
            }
        }];
    }
    return _container;
}

- (void)save
{
    [self saveWithContext:self.mainContext error:NULL];
}

- (void)saveWithContext:(NSManagedObjectContext *)moc error:(NSError **)error
{
    __block NSError *localError = nil;
    [moc performBlockAndWait:^{
        NSError *error = nil;
        if (![moc save:&error]) { // if this save is unsuccessful
            NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
            localError = error;
        }
    }];
    if (error) {
        *error = localError;
    }
}

@end
