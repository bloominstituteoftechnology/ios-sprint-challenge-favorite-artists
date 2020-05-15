//
//  ArtistController.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "ArtistController.h"

@implementation ArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artists = [[NSMutableArray alloc] init];
    }
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

//    NSLog(@"Artists count: %lu", (unsigned long)self.artists.count);
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

//    NSLog(@"Artists count: %lu", (unsigned long)self.artists.count);
}


@end
