//
//  MBArtistController.m
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBArtistController.h"


@implementation MBArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artists = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)createArtist:(MBArtist *)artist
{
    [self.artists addObject:artist];
}

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

- (void)getArtist:(NSString *)name completionBlock:( MBCompletionBlock)completionBlock;
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"s" value:name]
                            ];
    components.queryItems = queryItems;
    NSURL *url = components.URL;
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(nil, error);
            return;
        }
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, error);
            return;
        }
        NSArray *dictionary = json[@"artists"];
        MBArtist *artist = [[MBArtist alloc] initWithDictionary:dictionary[0]];
        completionBlock(artist, nil);
    }];
    [task resume];
}

- (MBArtist *)fetchSavedArtist:(MBArtist *)artist {
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:artist.artist] URLByAppendingPathExtension:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    MBArtist *savedArtist = [[MBArtist alloc] initWithDictionary:dictionary];
    return savedArtist;
}

- (NSMutableArray *)fetchedArtists {
    NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [searchPath objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    for (NSString *artist in filePaths) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artist];
        NSString *artistPath = [NSHomeDirectory()stringByAppendingPathComponent:filePath];
        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        if (artistData != nil) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            MBArtist *artist = [[MBArtist alloc] initWithDictionary:artistDictionary];
            [self.artists addObject:artist];
        } else {
            NSLog(@"Artist Data returned nil");
        }
    }
    return self.artists;
}

- (void)deleteArtist:(MBArtist *)artist
{
    [self.artists removeObject:artist];
}

@end
