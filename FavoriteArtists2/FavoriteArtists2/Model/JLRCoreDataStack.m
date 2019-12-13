//
//  JLRCoreDataStack.m
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLRCoreDataStack.h"

@interface JLRCoreDataStack ()

@end

@implementation JLRCoreDataStack

+ (JLRCoreDataStack *)sharedStack
{
    static JLRCoreDataStack *sharedStack = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStack = [[JLRCoreDataStack alloc] init];
    });
    return sharedStack;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _container = [NSPersistentContainer persistentContainerWithName:@"FavoriteArtists2"];
        [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * _Nonnull d, NSError * _Nullable error) {
            if (error != nil) {
                [NSException raise:@"UnloadedPersistentStore" format:@"Failed to load persistent stores: %@", error];
            }
        }];
    }
    return self;
}

@end
