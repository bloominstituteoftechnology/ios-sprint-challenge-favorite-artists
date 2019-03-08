//
//  IACLyricsController.m
//  Lyric Finder Async
//
//  Created by Ivan Caldwell on 3/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyricsController.h"

NSString *baseURL = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
NSString *apiKey = @"cbd2b1a12fmsh0aaf0cc245b3792p14052ajsn976898523b4d";

@implementation IACLyricsController

- (void)fetchLyricsForTitle:(NSString *)title artist:(NSString *)artist completionBlock:(CompletionHandler)completionBlock {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString: baseURL];
    NSMutableArray *queryItems = [@[[NSURLQueryItem queryItemWithName:@"q_artist" value: artist],
                                    [NSURLQueryItem queryItemWithName:@"q_track" value: title]
                                    ] mutableCopy];
    [urlComponents setQueryItems:queryItems];
    NSURL *url = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching lyrics: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!results) {
            NSLog(@"Error decoding json: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSString *lyrics = results[@"lyrics_body"];
        completionBlock(lyrics, nil);
        return;
  
    }] resume];
}

- (void)createLyricWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating {
    IACLyrics *song = [[IACLyrics alloc] initWithTitle:title  artist:artist lyrics:lyrics rating:rating];
    [self.songs addObject:song];
    
}

- (void)updateLyric:(IACLyrics *)song rating:(int)rating {
    song.rating = rating;
}

- (void)deleteLyric:(IACLyrics *)song {
    [self.songs removeObject:song];
}
@end
