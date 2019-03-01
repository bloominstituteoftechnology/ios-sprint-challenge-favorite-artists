//
//  DRMLyricController.m
//  LyricFinder
//
//  Created by Dillon McElhinney on 3/1/19.
//  Copyright © 2019 Dillon McElhinney. All rights reserved.
//

#import "DRMLyricController.h"

@implementation DRMLyricController

static NSString * baseURL = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
static NSString * apiKey = @"485bf8151emshd2b8d386cb8abf2p1f19ebjsnc1b5d543e37c";

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _lyrics = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createLyricWithArtist:(NSString *)artist trackName:(NSString *)trackName lyrics:(NSString *)lyrics andRating:(int)rating {
    DRMLyric *newLyric = [[DRMLyric alloc] initWith: artist trackName: trackName lyrics: lyrics andRating: rating];
    [self.lyrics addObject: newLyric];
}

- (void)updateLyric:(DRMLyric *)lyric withRating:(int)rating {
    [lyric setRating: rating];
}

- (void)deleteLyricAt:(NSIndexPath *)indexPath {
    [self.lyrics removeObjectAtIndex: indexPath.row];
}

- (void)fetchLyricsForArtist:(NSString *)artist andTrackName:(NSString *)trackName withCompletion:(CompletionHandler)completion {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString: baseURL];
    NSURLQueryItem *artistItem = [NSURLQueryItem queryItemWithName:@"q_artist" value: artist];
    NSURLQueryItem *trackItem = [NSURLQueryItem queryItemWithName:@"q_track" value: trackName];
    [urlComponents setQueryItems:@[artistItem, trackItem]];
    
    NSURL *requestURL = urlComponents.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setValue: apiKey forHTTPHeaderField:@"X-RapidAPI-Key"];
    
    NSURLSessionDataTask *datatask = [NSURLSession.sharedSession dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching lyrics: %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (data) {
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData: data options: 0 error: NULL];
            NSString *lyrics = results[@"lyrics_body"];
            completion(lyrics);
            return;
        } else {
            NSLog(@"No data was returned.");
            completion(nil);
        }
    }];
    
    [datatask resume];
}

@end
