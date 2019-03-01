//
//  LMSSongController.m
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSSongController.h"

@implementation LMSSongController

static NSString *baseURL = @"";
static NSString *apiKey = @"";

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
            NSLog(@"");
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"");
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
