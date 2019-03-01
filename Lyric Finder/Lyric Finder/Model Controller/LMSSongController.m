//
//  LMSSongController.m
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSSongController.h"

@implementation LMSSongController

static NSString *baseURL = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
static NSString *apiKey = @"fb00534250msh9ff07c452612a67p138fb1jsn921e8a2b3e43";

- (void)createLyricsWithArtist:(NSString *)artist andTrackName:(NSString *)trackName andLyrics:(NSString *)lyrics andRating:(int)rating {
    LMSSong *newSongLyric = [[LMSSong alloc] initWithArtist:artist andTrackName:trackName andLyrics:lyrics andRating:rating];
    [self.lyrics addObject: newSongLyric];
}

- (void)fetchSongLyrics:(NSString *)artist andTrackName:(NSString *)trackName withCompletion:(CompletionHandler)completion {
    
    NSURLComponents *components = [NSURLComponents componentsWithString:baseURL];
    NSURLQueryItem *artistItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *trackItem = [NSURLQueryItem queryItemWithName:@"q_track" value:trackName];
    
    components.queryItems = @[artistItem, trackItem];
    
    NSURL *requestURL = components.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setValue:apiKey forHTTPHeaderField:@"X-RapidAPI-Key"];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching lyrics: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"No data was found by data task");
            completion(nil);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSString *lyrics = dictionary[@"lyrics_body"];
        
        completion(lyrics);
        
    }];
    
    [dataTask resume];
}

@end
