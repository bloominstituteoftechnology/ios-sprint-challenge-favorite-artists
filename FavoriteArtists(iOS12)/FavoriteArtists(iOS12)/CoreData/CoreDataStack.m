//
//  CoreDataStack.m
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "CoreDataStack.h"
#import <CoreData/CoreData.h>

@implementation CoreDataStack

static CoreDataStack *_coreDataStack = nil;
@synthesize container = _container;

+ (CoreDataStack *)coreDataStack {
    if (_coreDataStack == nil) {
        _coreDataStack = [[CoreDataStack alloc]init];
    }
    return _coreDataStack;
}

+ (void)setCoreDataStack:(CoreDataStack *)coreDataStack {
    if(coreDataStack != _coreDataStack) {
        _coreDataStack = [coreDataStack copy];
    }
}
- (NSPersistentContainer *)container {
    
    @synchronized (self) {
        if ( _container == nil ) {
            _container = [[NSPersistentContainer alloc] initWithName:@"FavoriteArtists"];
            [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *_ , NSError *error) {
                if (error) {
                    NSLog(@"error loading from persistence store %@", error);
                }
            }];
        }
    }
    return _container;
}

- (NSManagedObjectContext *)context {
    return [[self container] viewContext];
}
@end
