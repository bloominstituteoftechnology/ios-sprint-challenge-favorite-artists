//
//  IIISongController.m
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIISongController.h"
#import "IIISong.h"

@interface IIISongController()

@property (nonatomic) NSMutableArray *internalSongs;

@end

@implementation IIISongController

static NSString * const baseURLSting = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const apiKEYString = @"rRDZaNCYpDmshhODZZeaGI0B2hBIp1REDV1jsnqpapjJKAKbMX";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createSongWithTitle:(NSString *)title
                     artist:(NSString *)artist
                     lyrics:(NSString *)lyrics
                     rating:(NSInteger)rating
{
    IIISong *song = [[IIISong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [self.internalSongs addObject:song];
}

- (void)searchLyricsWithArtist:(NSString *)artist title:(NSString *)title completion:(void (^)(NSString *lyrics, NSError *error))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLSting];
    NSURLQueryItem *artistParameter = [[NSURLQueryItem alloc] initWithName:@"q_artist" value:artist];
    NSURLQueryItem *titleParameter = [[NSURLQueryItem alloc] initWithName:@"q_track" value:title];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    [components setQueryItems:@[artistParameter, titleParameter]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:(components.URL)];
    [request setValue:apiKEYString forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error searching for lyrics %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned");
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, error);
            return;
        }
        
        NSString *lyricsBody = dictionary[@"lyrics_body"];
        completion(lyricsBody,nil);
        
    }] resume];
}

#pragma mark Persistent Store

- (void)saveToPersistentStore
{
    
}

- (void)loadFromPersistentStore
{
    
}

#pragma mark Getter

// This method gets called everytime app reads value of songs.
- (NSArray *)songs
{
    return self.internalSongs;
}

@end
