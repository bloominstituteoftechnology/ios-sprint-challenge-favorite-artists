//
//  YZISongsController.m
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import "YZISongsController.h"
#import "YZISongs.h"
#import "YZINSObject+JSONSerialization.h"

@interface YZISongsController()

@property (nonatomic) NSMutableArray *moreSongs;
@property (nonatomic) NSURL *songsURL;

@end

@implementation YZISongsController

- (NSArray *)songs
{
    return self.moreSongs;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _moreSongs = [[self loadFromPersistentStore] mutableCopy];
        _songsURL = [[NSURL alloc] init];
    }
    return self;
}



- (void)searchLyricsWithArtist:(NSString *)artist title:(NSString *)title completion:(void (^)(NSString *lyrics, NSError *error))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLSting];
    NSURLQueryItem *artistParameter = [[NSURLQueryItem alloc] initWithName:@"q_artist" value:artist];
    NSURLQueryItem *titleParameter = [[NSURLQueryItem alloc] initWithName:@"q_track" value:title];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    [components setQueryItems:@[artistParameter, titleParameter]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:(components.URL)];
    [request setValue:apiKEYString forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse *  response, NSError * error) {
        
        if (error) {
            NSLog(@"Error searching for lyrics %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned");
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, error);
            return;
        }
        
        NSString *lyricsBody = dictionary[@"lyrics_body"];
        completion(lyricsBody,nil);
        
    }] resume];
}

- (void)createSongsWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating
{
    YZISongs *songs = [[YZISongs alloc] initWithTitle:title lyrics:lyrics artist:artist  rating:rating];
    [self.moreSongs addObject:songs];
    [self saveToPersistentStore];
}

// Persistance

- (NSArray *)loadFromPersistentStore
{
    NSData *songData = [NSData dataWithContentsOfURL:self.songsURL];
    if (!songData) { return @[]; }
    
    NSArray *songsFromData = [NSJSONSerialization JSONObjectWithData:songData options:0 error:nil];
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < songsFromData.count; i++) {
        NSDictionary *songDict = songsFromData[i];
        YZISongs *song = [[YZISongs alloc] initWithDictionary:songDict];
        [songs addObject:song];
    }
    
    if (songs) {
        return songs;
    } else {
        return @[];
    }
}



- (void)saveToPersistentStore
{
    NSMutableArray *songDictionaries = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.moreSongs.count; i++) {
        YZISongs *song = self.moreSongs[i];
        [songDictionaries addObject:[song songDictionary]];
    }
    
    NSData *songsData = [NSJSONSerialization dataWithJSONObject:songDictionaries options:0 error:nil];
    [songsData writeToURL:self.songsURL atomically:YES];
    
}



- (NSURL *)songsURL
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileName = @"Lyrics.plist";
    NSURL *documentDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

static NSString * const baseURLSting = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const apiKEYString = @"SmEk59cVPUmshCuD7TgaYSGQCzXjp1N6gB8jsngwLrFSCZhFtl";



@end

