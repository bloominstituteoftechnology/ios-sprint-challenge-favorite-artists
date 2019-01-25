//
//  SongController.m
//  Lyric Finder
//
//  Created by Sean Hendrix on 1/25/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import "SongController.h"
#import "Song.h"
@interface  SongController ()
@property (nonatomic, copy) NSMutableArray *internalSongs;
@end

@implementation SongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [@[] mutableCopy];
    }
    return self;
}

- (void)createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger *)rating
{
    Song *song =  [[[Song alloc] init] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [self.internalSongs addObject:song];
    [self saveSong];
}


- (void)saveSong
{
    NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"songs.json"];
    
    NSMutableArray *songDictionaries = [[NSMutableArray alloc] init];
    
    for(Song *internalSong in self.internalSongs) {
        NSDictionary *songDictionary = @{@"title": internalSong.title, @"artist": internalSong.artist, @"lyrics": internalSong.lyrics, @"rating": [NSNumber numberWithInteger:internalSong.rating]};
        [songDictionaries addObject:songDictionary];
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:songDictionaries options:0 error:nil];
    
    [data writeToURL:documentDirectory atomically:YES];
}

- (void)loadSongs
{
    NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"songs.json"];
    
    NSData *data = [NSData dataWithContentsOfURL:documentDirectory];
    
    if(!data) {
        return;
    }
    
    NSArray *songDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    for(NSDictionary *songDictionary in songDictionaries) {
        Song *song = [[Song alloc] initWithDictionary: songDictionary];
        [self.internalSongs addObject:song];
    }
}

- (void)updateSongWithSong:(Song *)song title:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger *)rating
{
    unsigned long index = [self.internalSongs indexOfObject:song];
    Song *existingSong = self.internalSongs[index];
    [existingSong setTitle: title];
    [existingSong setArtist: artist];
    [existingSong setLyrics: lyrics];
    [existingSong setRating: rating];
}

- (void)searchForLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *lyrics, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *artistQueryItem = [[NSURLQueryItem alloc] initWithName:@"q_artist" value:artist];
    NSURLQueryItem *titleQueryItem = [[NSURLQueryItem alloc] initWithName:@"q_track" value:title];
    
    [components setQueryItems: @[artistQueryItem, titleQueryItem]];
    NSURL *URL = [components URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    [request setValue:apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error searching for person: %@", error);
            completion(nil, error);
            return;
        }
        
        if(!data) {
            NSLog(@"No data returned from data task");
            completion(nil, [[NSError alloc] init]);
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        if (![dictionary isKindOfClass: [NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *lyrics = dictionary[@"lyrics_body"];
        
        
        completion(lyrics, nil);
        
    }] resume];
}

- (void)changeRatingOfSong:(Song *)song rating:(NSInteger *)rating
{
    song.rating = rating;
}

-(NSArray *)songs {
    return [self.internalSongs copy];
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const apiKey = @"Zn6GslkyY9mshlvCHYSrczsmBUnSp1a5FqijsnbRDlvYCO175m";

@end
