//
//  JKLyricFinderController.m
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKLyricFinderController.h"


@implementation JKLyricFinderController

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        [self setSongs:@{}];
    }
    return self;
}

- (void)fetchSongInfoByArtist:(NSString *)artist andWithTitle:(NSString *)title withBlock:(CompletionBlock)block {
    
    NSDictionary *headers = @{@"X-RapidAPI-Key": @"229497ddc9msh1274a5e55aaf19bp1d89a8jsn08a5dcd5d514"};
    UNIUrlConnection *asyncConnection = [[[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get?q_artist=phish&q_track=llama"];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        NSInteger code = response.code;
        NSDictionary *responseHeaders = response.headers;
        UNIJsonNode *body = response.body;
        NSData *rawBody = response.rawBody;
    }] asJson];
}

@end
