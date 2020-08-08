//
//  FavoriteArtistController.m
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteArtistController.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"


@interface FavoriteArtistController () {
    NSMutableArray *_interalArtists;
}

@end

@implementation FavoriteArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _interalArtists = [[NSMutableArray alloc] init];
        
        NSString *filePath = self.getFilePath;
        NSFileManager *fileManger = [NSFileManager defaultManager];
        
        if ([fileManger fileExistsAtPath:filePath]) {
            NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfURL:self.getFileURL];
            [self updateArtistArrayWithDictionary:dictionary];
        }
        
    }
    return self;
}

// Mark: - Convenience Accessors

- (NSArray<Artist *> *)artist
{
    return _interalArtists.copy;
}

- (void)saveToPersistentStore
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (Artist *artist in _interalArtists) {
        NSString *key = artist.name;
        dictionary[key] = artist.toDictionary;
    }

    [dictionary writeToURL:self.getFileURL atomically:YES];
}
- (void)addArtist:(Artist *)artist
{
    [_interalArtists addObject:artist];
    [self saveToPersistentStore];
}

- (void)deleteArtist:(Artist *)artist
{
    [_interalArtists removeObject:artist];
    [self saveToPersistentStore];
}

- (NSURL *)getFileURL
{
    NSString *fileName = @"FavoriteArtistsData.plist";
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSURL *fileURL = [baseURL URLByAppendingPathComponent:fileName];
    return fileURL;
}

- (NSString *)getFilePath
{
    return self.getFileURL.path;
}



- (void)updateArtistArrayWithDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *artistDictionary in dictionary.allValues) {
        Artist *artist = [[Artist alloc] initwithDictionary:artistDictionary];
        [array addObject:artist];
    }
}
@end
