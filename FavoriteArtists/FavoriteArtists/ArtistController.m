//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"
#import "Artist+NJSONSerialization.h"

@interface ArtistController () {
    NSMutableArray *_internalArtists;
}
@end

@implementation ArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
        
        NSString *filePath = self.getFilePath;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if ([fileManager fileExistsAtPath:filePath]) {
            NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfURL:self.getFileURL];
            [self updateArtistsDictionary:dictionary];
        }
    }
    
    return self;
}

- (NSURL *)getFileURL
{
    NSString *fileName = @"FavoriteArtists.plist";
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSURL *fileURL = [baseURL URLByAppendingPathComponent:fileName];
    return fileURL;
}

- (NSString *)getFilePath
{
    return self.getFileURL.path;
}

- (void)saveToPersistentStore
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (Artist *artist in _internalArtists) {
        NSString *key = artist.name;
        dictionary[key] = artist.toDictionary;
    }
    
    [dictionary writeToURL:self.getFileURL atomically:YES];
}

- (void)updateArtistsDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *artistDictionary in dictionary.allValues) {
        Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];
        [array addObject:artist];
    }
    
    _internalArtists = array;
}

- (NSArray<Artist *> *)artists
{
    return _internalArtists.copy;
}

- (void)addArtist:(Artist *)artist
{
    [_internalArtists addObject:artist];
    [self saveToPersistentStore];
}

@end
