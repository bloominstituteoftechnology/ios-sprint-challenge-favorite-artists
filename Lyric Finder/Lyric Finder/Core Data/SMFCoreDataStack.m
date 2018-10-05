//
//  SMFCoreDataStack.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "SMFCoreDataStack.h"

@implementation SMFCoreDataStack

- (instancetype)init
{
    self = [super init];
    if (self) {
        _container = [[NSPersistentContainer alloc] initWithName:@"LyricFinder"];
        [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *d, NSError *error) {
            if (error != nil) {
                [NSException raise:@"UnloadedPersistentStore" format:@"Failed to load persistent stores: %@", error];
            }
        }];
        _container.viewContext.automaticallyMergesChangesFromParent = YES;
    }
    
    return self;
}

@end


