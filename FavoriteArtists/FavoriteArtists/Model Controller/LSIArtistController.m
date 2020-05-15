//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

static NSString *artistsKey = @"artists";

@interface LSIArtistController ()

@property (nonatomic, readwrite, copy) NSArray *artists;
- (NSURL *)persistentStoreURL;
- (NSArray<LSIArtist *> *)loadFromPersistentStore;
- (void)saveToPersistentStore;

@end

@implementation LSIArtistController

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    NSArray<LSIArtist *> *artists = [self loadFromPersistentStore];
    if (artists) {
        _artists = artists;
    } else {
        _artists = [[NSArray alloc] init];
    }

    return self;
}

- (void)addArtist:(LSIArtist *)artist {
    self.artists = [self.artists arrayByAddingObject:artist];
    [self saveToPersistentStore];
}

- (NSURL *)persistentStoreURL {
    NSURL *url = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    return [[url URLByAppendingPathComponent:@"favorite-artists"] URLByAppendingPathExtension:@"plist"];
}

- (NSArray<LSIArtist *> *)loadFromPersistentStore {
    NSDictionary *store = [[NSDictionary alloc] initWithContentsOfURL:[self persistentStoreURL]];
    if (store) {
        return store[artistsKey];
    } else {
        return nil;
    }
}

- (void)saveToPersistentStore {
    NSDictionary *store = @{artistsKey: self.artists};
    [store writeToURL:[self persistentStoreURL] error:nil];
}

@end
