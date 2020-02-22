//
//  BFVCoreDataStack.m
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "BFVCoreDataStack.h"
@interface BFVCoreDataStack()

@end


@implementation BFVCoreDataStack

+ (BFVCoreDataStack *)shared {
    static BFVCoreDataStack *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[BFVCoreDataStack alloc] init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _container = [NSPersistentContainer persistentContainerWithName:@"FavoriteArtists"];
        [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * storeDescription, NSError * error) {
            if (error) {
                NSLog(@"failed to load from persistence store: %@", error);
            }
                }];
    }
    return self;
}

- (NSManagedObjectContext *)mainContext {
    return self.container.viewContext;
}
@end
