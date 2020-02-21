//
//  CARCoreDataStack.m
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARCoreDataStack.h"

@interface CARCoreDataStack()

@property (nonatomic, strong) NSPersistentContainer *persistentContainer;

@end

@implementation CARCoreDataStack

- (id) init {
    self = [super init];
    if (self) {
        NSURL *fileURL = [NSBundle.mainBundle URLForResource:@"CARFavoriteArtists" withExtension:@"momd"];
        NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:fileURL];
        self.persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CARFavoriteArtists" managedObjectModel:managedObjectModel];
        [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        }];
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = YES;
    }
    return self;
}

- (NSManagedObjectContext *)viewContext {
    if (![NSThread mainThread]) {
        NSLog(@"Accessing context on the wrong thread!");
    }
    return self.persistentContainer.viewContext;
}

@end
