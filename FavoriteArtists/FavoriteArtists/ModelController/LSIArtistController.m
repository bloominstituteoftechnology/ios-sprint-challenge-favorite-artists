//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistController () {
    NSMutableArray *_internalArtists;
}

@end

@implementation LSIArtistController

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
    for (LSIArtist *artist in _internalArtists) {
        NSString *key = artist.name;
        dictionary[key] = artist.toDictionary;
    }

    [dictionary writeToURL:self.getFileURL atomically:YES];
}

- (void)updateArtistsDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *artistDictionary in dictionary.allValues) {
        LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDictionary];
        [array addObject:artist];
    }

    _internalArtists = array;
}

- (NSArray <LSIArtist *> *)artists
{
    return _internalArtists.copy;
}

- (void)addArtist:(LSIArtist *)artist
{
    [_internalArtists addObject:artist];
    [self saveToPersistentStore];
}

@end
