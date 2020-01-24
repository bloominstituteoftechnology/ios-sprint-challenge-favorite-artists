//
//  JBArtistController.m
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import "JBArtistController.h"
#import "JBArtist.h"
#import "JBArtist+NSJSONSerialization.h"
#import "JBFileHelper.h"


static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";
static NSString *artistsKey = @"artists";

@interface JBArtistController ()

@property (nonatomic) NSMutableArray *mutableArtists;
@property (nonatomic, readonly) NSURL *documentDirectory;
@property (nonatomic, readonly) NSURL *persistenceFilePath;
- (void)saveArtistsToPersistence;
- (void)saveArtistToPersistence:(JBArtist *)artist;
- (NSArray *)artistsOnDisk;

@end


@implementation JBArtistController

- (NSArray *)artists
{
    return [self.mutableArtists copy];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *artists = self.artistsOnDisk;
        _mutableArtists = [((artists) ? artists : @[]) mutableCopy];
    }
    return self;
}

#pragma mark - Public API

- (void)addArtist:(JBArtist *)artist
{
    [self.mutableArtists addObject:artist];
}

- (void)fetchArtistWithName:(NSString *)name
                 completion:(void (^)(JBArtist *artist, NSError *error))completion
{
    NSURLComponents *components = [NSURLComponents componentsWithString:baseURLString];
    components.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    [[NSURLSession.sharedSession dataTaskWithURL:components.URL
                               completionHandler:^(NSData * _Nullable data,
                                                   NSURLResponse * _Nullable response,
                                                   NSError * _Nullable error)
    {
        if (error)
        {
            completion(nil, error);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jsonError];
        if (jsonError)
        {
            completion(nil, error);
            return;
        }
        NSArray *artists = dictionary[artistsKey];
        if (artists.count > 0)
        {
            NSDictionary *artistDict = artists.firstObject;
            JBArtist *artist = [[JBArtist alloc] initWithDictionary:artistDict];
            completion(artist, nil);
        }
        else
        {
            completion(nil, nil);
        }
    }] resume];
}

#pragma mark - Persistence

- (void)saveArtistsToPersistence
{
    NSMutableArray *artistDicts = [@[] mutableCopy];
    for (JBArtist *artist in self.artists)
    {
        [artistDicts addObject:artist.toDictionary];
    }
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    dictionary[artistsKey] = artistDicts;

    [dictionary writeToURL:self.persistenceFilePath atomically:YES];
}

- (void)saveArtistToPersistence:(JBArtist *)artist
{
    [artist.toDictionary
     writeToURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"artist_%@", artist.name]
                         relativeToURL:self.documentDirectory] atomically:YES];
}

- (NSArray *)artistsOnDisk
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:self.persistenceFilePath];
    return dictionary[artistsKey];
}

- (NSURL *)persistenceFilePath
{
    return [NSURL URLWithString:[self.documentDirectory.path
                                 stringByAppendingPathComponent:@"favoriteArtists.json"]];
}

- (NSURL *)documentDirectory
{
    return [[[NSFileManager defaultManager]
             URLsForDirectory:NSDocumentDirectory
             inDomains:NSUserDomainMask] lastObject];
}

@end
