//
//  DYPSongController.m
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import "DYPSongController.h"
#import "DYPSong.h"
#import "DYPSong+NSJSONSerialization.h"

@interface DYPSongController ()

@property (nonatomic, copy) NSMutableArray *internalSongs;

@end

@implementation DYPSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [@[] mutableCopy];
        [self loadFromPersistenceStore];
    }
    return self;
}

- (void)addASongWithTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    DYPSong *song = [[DYPSong alloc] initWithTitle:title artistName:artistName lyrics:lyrics rating:rating];
    [self.internalSongs addObject:song];
    
    //[self persistSong:song];
}

- (void)searchLyricsForSongTitle:(NSString *)title artistName:(NSString *)artistName completion:(void (^)(NSString * _Nullable lyrics, NSError * _Nullable error))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLQueryItem *artistItem = [[NSURLQueryItem alloc] initWithName:@"q_artist" value:artistName];
    
    NSURLQueryItem *songTitleItem = [[NSURLQueryItem alloc] initWithName:@"q_track" value:title];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    [components setQueryItems:@[artistItem, songTitleItem]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:components.URL];
    
    [request setValue:APIKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error searching for lyrics: %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned from data task");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        DYPSong *song = [[DYPSong alloc] initFromDictionary:dictionary songTitle:title artistName:artistName];
        completion(song.lyrics, nil);
        
    }] resume];
    
}

- (void)persistSong:(DYPSong *)song
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"LyricFinderSavedSongs.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //Add dictionary of songs not just the one song.
    NSDictionary *songDictionary = song.songDictionary;
    [songDictionary writeToFile:path atomically:YES];
}

- (void)loadFromPersistenceStore
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"LyricFinderSavedSongs.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDictionary *resultDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if (resultDictionary) {
        //Set songs to songs.
        DYPSong *song = [[DYPSong alloc] initFromPlistDictionary:resultDictionary];
        [self.internalSongs addObject:song];
    }
}

- (NSArray *)songs
{
    return self.internalSongs;
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const APIKey = @"s5sDpvaGIxmshWxJHrvDozLn9VUPp1rrLwXjsnaSqXGlizcXAd";

@end
