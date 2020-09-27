//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "ArtistController.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

@interface ArtistController () {
    NSMutableArray *_internalArtists;
}

@end

@implementation ArtistController

-(instancetype)init
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

- (void)saveToPersistenStore
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (Artist *artist in _internalArtists) {
        NSString *key = artist.name;
        dictionary[key] = artist.toDictionary;
    }

    [dictionary writeToURL:self.getFileURL atomically:YES]
}

@end
