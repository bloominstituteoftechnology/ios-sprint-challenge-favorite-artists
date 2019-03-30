//
//  MJRSongController.m
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRSongController.h"
#import "MJRSong.h"

@interface MJRSongController()

@property (nonatomic) NSMutableArray *internalSongs;

@end

@implementation MJRSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _internalSongs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    MJRSong *song = [[MJRSong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    
    [self.internalSongs addObject:song];
}

- (void)fetchLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *lyrics, NSError *error))completion
{
    
    NSURL *baseURL = [NSURL URLWithString: baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *artistItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *titleItem = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    
    
    [components setQueryItems:@[artistItem, titleItem]];
    
    NSURL *requestURL = components.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    
    [request setValue:apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"No data returned form data task");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        // Check to make sure that the dictionary is actually s dictionary
        if (![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            
            // if it's not actually a dictionary.
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *lyrics = jsonDictionary[@"lyrics_body"];
        
        completion(lyrics, nil);
    }];
    
    [dataTask resume];
}

- (NSArray *)songs
{
    return self.internalSongs;
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
static NSString * const apiKey = @"55d1a9ccc2msh0bdf182300ce3d1p1e40c3jsn514cc1823b7f";

@end
