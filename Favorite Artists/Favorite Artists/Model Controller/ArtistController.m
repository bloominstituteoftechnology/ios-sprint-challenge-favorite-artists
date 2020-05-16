//
//  ArtistController.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "ArtistController.h"
#import "MTGArtist.h"
#import "MTGArtist+NSJSONSerialization.h"

static NSString *artistsKey = @"Artists";

@implementation ArtistController

- (instancetype)init
{
    self = [super init];
    if (self == nil ) { return nil; }

    NSLog(@"%@", [self persistentStoreURL]);

    _artists = [[NSMutableArray alloc] init];

    NSMutableArray<MTGArtist *> *artists = [self loadFromPersistentStore];
    if (artists) {
        _artists = artists;
    } else {
        _artists = [NSMutableArray new];
    }

    return self;



    return self;
}

// MARK: - CRUD

// Create

- (void)add:(MTGArtist *)artist {
    @try  {
       [self.artists addObject:artist];
    } @catch (NSException *exception) {
       NSLog(@"%@ ",exception.name);
       NSLog(@"Reason: %@ ",exception.reason);
    }

    NSLog(@"Artists count: %lu", (unsigned long)self.artists.count);

//    [self saveToPersistentStore];
}

// Read

// Update

// Delete
- (void)delete:(long)atIndex {
    @try  {
       [self.artists removeObjectAtIndex:atIndex];
    } @catch (NSException *exception) {
       NSLog(@"%@ ",exception.name);
       NSLog(@"Reason: %@ ",exception.reason);
    }

//    [self saveToPersistentStore];

//    NSLog(@"Artists count: %lu", (unsigned long)self.artists.count);
}

// MARK: - Persistence Store

- (NSURL *)persistentStoreURL {

    NSURL *documentDirecrtoryUrl = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] objectAtIndex:0];

    NSURL *filenameUrl = [[documentDirecrtoryUrl URLByAppendingPathComponent:@"Favorite Artists"] URLByAppendingPathExtension:@"plist"];

    return filenameUrl;
}

- (NSMutableArray<MTGArtist *> *)loadFromPersistentStore {

    return nil; // FIXME:

    NSDictionary *store = [[NSDictionary alloc] initWithContentsOfURL:[self persistentStoreURL]];

    if (store != nil) {
        NSArray *artistDicts = store[artistsKey];
        NSMutableArray *artists = [[NSMutableArray alloc] init];

        for (NSDictionary *artistDict in artistDicts) {
            [artists addObject:[[MTGArtist alloc] initWithDictionary:artistDict]];
        }
        return [artists copy];
    } else {
        return nil;
    }
}

- (void)saveToPersistentStore {

    NSMutableArray *artistDicts = [[NSMutableArray alloc] init];

    for (MTGArtist *artist in self.artists) {
        [artistDicts addObject:[artist toDictionary]];
    }

    NSDictionary *store = @{artistsKey: artistDicts};
    [store writeToURL:[self persistentStoreURL] error:nil];
}

@end
