//
//  SongController.m
//  Lyric Finder
//
//  Created by Moin Uddin on 11/16/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

#import "SongController.h"

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
