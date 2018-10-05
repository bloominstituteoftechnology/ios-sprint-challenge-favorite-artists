//
//  SMFSongController.m
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "SMFSongController.h"
#import "SMFCoreDataStack.h"
#import "SMFSong+SMFConvenience.h"

#pragma mark Extension
@interface SMFSongController ()

@property (readwrite) NSManagedObjectContext *moc;

@end

#pragma mark - Implementation
@implementation SMFSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _moc = [[[[SMFCoreDataStack alloc] init] container] viewContext];
    }
    return self;
}

#pragma mark - CoreData
- (void)saveToCoreData {
    NSError *error = nil;
    if ([self.moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

#pragma mark - CRUD
- (void)createWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating {
    __unused SMFSong *s = [[SMFSong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating context:self.moc];
    [self saveToCoreData];
}
- (void)updateSong:(SMFSong *)song rating:(NSInteger)rating {
    song.rating = rating;
    [self saveToCoreData];
}
- (void)deleteSong:(SMFSong *)song {
    [self.moc deleteObject:song];
    [self saveToCoreData];
}

@end
