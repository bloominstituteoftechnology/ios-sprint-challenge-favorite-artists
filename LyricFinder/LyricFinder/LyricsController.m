//
//  LyricsController.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "LyricsController.h"
#import "Lyrics+NSJSONSerialization.h"

@implementation LyricsController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _results = [[NSString alloc] init];
    }
    return self;
}

- (void)fetchLyricsWithArtist:(NSString *)artist withTrack:(NSString *)track withCompletionHandler:(void (^)(NSError * _Nonnull))completionHandler {
    
    NSURL *baseURL = [[NSURL alloc]initWithString:@"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get"];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:NO];
    //Append Query Items
    urlComponents.queryItems = @[
                                 [NSURLQueryItem queryItemWithName: @"q_artist" value:[artist lowercaseString]],
                                 [NSURLQueryItem queryItemWithName: @"q_track" value:[track lowercaseString]]
                                 ];
    NSURL *requestURL = urlComponents.URL;
    
    //Add api information to request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setValue:@"15139afd57mshe5292a6c8032203p16818ajsn13ca57f73796" forHTTPHeaderField:@"X-Mashape-Key"];
    
    //Perform DataTask
    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error performing dataTask in LyricsController.fetchLyricsWithArtist");
            completionHandler(error);
            return;
        }
        if (data != nil) {
            NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:data options:0 error: nil];
            Lyrics *lyrics = [[Lyrics alloc] initWithDictionary:parsedData];
                                        self->_results = lyrics.lyricsBody;
        }
    }] resume];
}

@end
