//
//  JDBSongController.m
//  Lyric-Finder
//
//  Created by Madison Waters on 3/8/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import "JDBSongController.h"

//NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
//
//[request setValue:@"697bc5edf8msh2a32395bec9e2f8p13cd7ajsn4871705be036" forHTTPHeaderField:@"X-Mashape-Key"];

@implementation JDBSongController

-(void) FetchSongWithTitle:(NSString *)title artist:(NSString *)artist completion:(SongCompletion)completion {
    
    NSDictionary *headers = @{@"X-RapidAPI-Key": @"697bc5edf8msh2a32395bec9e2f8p13cd7ajsn4871705be036"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        
        [request setUrl:@"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get?"];
        //q_artist=coldplay&q_track=paradise
        // Construct the url
        NSURL *baseURL = [NSURL URLWithString:_setUrl];
        NSURLComponents *components = [NSURL componentsWithString:baseURL resolvingAgainstBaseURL: YES];
        
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        NSInteger code = response.code;
        NSDictionary *responseHeaders = response.headers;
        UNIJsonNode *body = response.body;
        NSData *rawBody = response.rawBody;
    }];
}

@end
