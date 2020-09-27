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

        NSString *filePath = self.getArtistPath;
        NSFileManager *fileManager = [NSFileManager defaultManager];

        if ([fileManager fileExistsAtPath:filePath]) {
            NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfURL:self.getArtistURL];
            [self updateArrayWithDictionary:dictionary];
        }
    }
    return self;
}

- (void)addArtist:(JSKArtist *)artist {

    [_internalArtist addObject:artist];
    [self saveToPersistentStore];
}


- (NSArray *)artists {
    return _internalArtist;
}

- (NSURL *)getArtistURL {

    NSString *fileName = @"FavoriteArtistsData.plist";
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSURL *artistURL = [baseURL URLByAppendingPathComponent:fileName];
    return artistURL;
}

- (NSString *)getArtistPath
{
    return self.getArtistURL.path;
}

- (NSArray *)loadArtist {

    NSData *artistData = [NSData dataWithContentsOfURL: [self getArtistURL] ];

    if(!artistData) {
        return @[];
    }

    NSError *jsonError = nil;
    NSArray *savedArtistsArray = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:&jsonError];
    if(jsonError) {
        NSLog(@"failed to fetch movies from documents directory: %@", jsonError);
        return @[];
    }

    NSMutableArray *artists = [[NSMutableArray alloc] init];
    for(int i = 0; i < savedArtistsArray.count; i++) {
        NSDictionary *artistDictionary = savedArtistsArray[i];
        JSKArtist *artist = [[JSKArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }

    return artists;
}

- (void)saveToPersistentStore {

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];

    for (JSKArtist *artist in _internalArtist) {
        NSString *key = artist.artistName;
        dictionary[key] = artist.toDictionary;
    }
    [dictionary writeToURL:[self getArtistURL] atomically:YES];
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
