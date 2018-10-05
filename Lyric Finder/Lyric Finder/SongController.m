//
//  SongController.m
//  Lyric Finder
//
//  Created by Vuk Radosavljevic on 10/5/18.
//  Copyright © 2018 Vuk. All rights reserved.
//

#import "SongController.h"
#import "Song.h"


@interface SongController ()

@property(readwrite) NSMutableArray *songs;
@end



@implementation SongController


-(instancetype)init
{
    self = [super init];
    if (self) {
        _songs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating {
    Song *song = [[Song alloc] initWithTitle: title artist: artist lyrics: lyrics rating: rating];
    [self.songs addObject:song];
    
    
   
}

- (void)searchForSongWithArtist:(NSString *)artist trackName:(NSString *)trackName completion:(void (^)(NSDictionary *song, NSError *))completion

{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *artistItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *trackItem = [NSURLQueryItem queryItemWithName:@"q_track" value:trackName];
    
    [components setQueryItems:@[artistItem, trackItem]];
    
    NSURL *url = [components URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *r, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
        }
        
        completion(dictionary, nil);
        
        
        
        
        
        
        
    }]resume];
    
    
    
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";

static NSString * const apiKey = @"9obWvAEVhNmshqwT37KwLIpMrFMgp1P8w54jsnRUryYcEwx8GE";

@end
