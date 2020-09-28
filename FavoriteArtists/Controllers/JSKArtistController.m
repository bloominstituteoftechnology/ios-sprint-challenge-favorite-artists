//
//  JSKArtistController.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtistController.h"
#import "JSKArtist.h"
#import "JSKArtist+NSJSONSerialization.h"
#import "JSKAddArtistViewController.h"

@interface JSKArtistController() {

 NSMutableArray *_internalArtist;

}

@end

@implementation JSKArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtist = [[NSMutableArray alloc] init];

        NSString *filePath = self.getFilePath;
        NSFileManager *fileManager = [NSFileManager defaultManager];

        if ([fileManager fileExistsAtPath:filePath]) {
            NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfURL:self.getFileURL];
            [self updateArrayWithDictionary:dictionary];
        }
    }
    return self;
}

- (void)addArtist:(JSKArtist *)artist {

    [_internalArtist addObject:artist];
    [self saveToPersistentStore];
}


- (NSArray<JSKArtist *> *)artists {
    return _internalArtist.copy;
}

- (NSURL *)getFileURL {

    NSString *fileName = @"FavoriteArtistsData.plist";
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSURL *artistURL = [baseURL URLByAppendingPathComponent:fileName];
    return artistURL;
}

- (NSString *)getFilePath
{
    return self.getFileURL.path;
}

- (void)saveToPersistentStore {

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];

    for (JSKArtist *artist in _internalArtist) {
        NSString *key = artist.artistName;
        dictionary[key] = artist.toDictionary;
    }
    [dictionary writeToURL:self.getFileURL atomically:YES];
}

- (void)updateArrayWithDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *artistDictionary in dictionary.allValues) {
        JSKArtist *artist = [[JSKArtist alloc] initWithDictionary:artistDictionary];
        [array addObject:artist];
    }
    _internalArtist = array;
}

@end
