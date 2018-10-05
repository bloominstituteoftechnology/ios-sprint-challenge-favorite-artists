//
//  CLSSongController.m
//  LyricFinder
//
//  Created by Carolyn Lea on 10/5/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

#import "CLSSongController.h"

@interface CLSSongController ()

@property(readwrite) NSMutableArray *songs;

@end

@implementation CLSSongController

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.songs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    Song *song = [[Song alloc] initWithArtist:artist  title:title lyrics:lyrics  rating:rating];
    
    [self.songs addObject:song];
}

- (void)updateSong:(Song *)song title:(NSString *)title artist:(NSString *)artist
{
    song.title = title;
    song.artist = artist;
}

-(void)searchForSongWithArtist:(NSString *)artist trackName:(NSString *)trackName completion:(void (^)(NSArray *songs, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:lyricsGET];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *q_artist = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    
    NSURLQueryItem *q_track = [NSURLQueryItem queryItemWithName:@"q_track" value:trackName];
    
    [components setQueryItems:@[q_artist, q_track]];
    
    NSURL *url = [components URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error != nil)
        {
            NSLog(@"Error fetching data: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            
            return;
        }
        
        if (!data)
        {
            NSLog(@"Data is missing");
            dispatch_async(dispatch_get_main_queue(), ^{
                
                completion(nil, [[NSError alloc] init]);
            });
            
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        if (![dictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"JSON was not a dictionary");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                completion(nil, [[NSError alloc] init]);
            });
            
            return;
        }
        
        NSArray *songs = dictionary[@"lyrics_body"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(songs, nil);
        });
    }] resume];
    
}

@end
