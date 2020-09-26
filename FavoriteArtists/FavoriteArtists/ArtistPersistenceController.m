//
//  ArtistPersistenceController.m
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import "ArtistPersistenceController.h"
#import "Artist.h"
#import "Artist+JSONSerialization.h"


@interface ArtistPersistenceController () {
    NSMutableArray *_internalArtists;
}

@end

@implementation ArtistPersistenceController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
        
        // Load favorite artists from disk
        NSString *filePath = self.getFilePath;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if ([fileManager fileExistsAtPath:filePath]) {
            NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfURL:self.getFileURL];
            [self updateArtistsArrayWithDictionary:dictionary];
        }
    }
    return self;
}

#pragma mark - Convenience Accessors

- (NSArray<Artist *> *)artists
{
    return _internalArtists.copy;
}

- (void)addArtist:(Artist *)artist
{
    [_internalArtists addObject:artist];
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

- (void)saveToPersistentStore
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (Artist *artist in _internalArtists) {
        NSString *key = artist.artistName;
        dictionary[key] = artist.toDictionary;
    }
    
    [dictionary writeToURL:self.getFileURL atomically:YES];
}

- (void)updateArtistsArrayWithDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *artistDictionary in dictionary.allValues) {
        Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];
        [array addObject:artist];
    }
    
    _internalArtists = array;
}

@end
