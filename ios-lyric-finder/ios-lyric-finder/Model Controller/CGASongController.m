//
//  CGASongController.m
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "CGASongController.h"
#import "CGASong.h"

@implementation CGASongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _songs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchForSongWithArtist:(NSString *)artist track:(NSString *)track completion:(void (^)(NSString *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *artistQueryItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *trackQueryItem = [NSURLQueryItem queryItemWithName:@"q_track" value:track];
    [components setQueryItems:@[artistQueryItem, trackQueryItem]];
    NSURL *requestURL = [components URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    
    [request setValue:@"39xWUPgsL2mshrjR0vO8Ce5pEZJjp1eTiNdjsnd6nmuGevMNkg" forHTTPHeaderField:@"X-Mashape-Key"];
    
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *r, NSError *error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *songResult = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![songResult isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *songLyrics = songResult[@"lyrics_body"];
        completion(songLyrics, nil);
        
    }] resume];
    
}

- (void)createSongWithArtist:(NSString *)artist track:(NSString *)track lyrics:(NSString *)lyrics rating:(double)rating {
    CGASong *song = [[CGASong alloc] initWithSong:track artist:artist lyrics:lyrics rating:rating];
    [[self songs] addObject:song];
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";

@end
