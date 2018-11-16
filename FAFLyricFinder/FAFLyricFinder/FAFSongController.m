//
//  FAFSongController.m
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import "FAFSongController.h"
#import "FAFSong.h"

@interface FAFSongController()

@property NSMutableArray *songs;

@end

@implementation FAFSongController

static NSString * baseStringURL = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";

//Query items look like ->  ?q_artist=coldplay&q_track=paradise'

- (instancetype)init
{
    self = [super init];
    if (self) {
        _songs = [@[] mutableCopy];
    }
    return self;
}

-(NSArray *)songsReadOnly{
    return [self songs];
}

- (void)fetchLyricsWithName:(NSString *)name artist:(NSString *)artist completion:(void (^)(NSString *, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseStringURL];
    
    NSURLQueryItem *artistNameQueryItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    
    NSURLQueryItem *songNameQueryItem = [NSURLQueryItem queryItemWithName:@"q_track" value:name];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    [components setQueryItems:@[artistNameQueryItem, songNameQueryItem]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:components.URL];
    
    [request setValue:@"f1TjA2OkJhmshkFtRbtlVORhOucZp1iX1FkjsntohZSXFAThBK" forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
          
          if (error){
              NSLog(@"Error searching for song %@", error);
              completion(nil, error);
              return;
          }
          
          if (!data){
              NSLog(@"No data returned from data task");
              completion(nil, [[NSError alloc] init]);
              return;
          }
          
          NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
          
          if (![dictionary isKindOfClass:[NSDictionary class]]){
              NSLog(@"JSON is not a dictionary");
              completion(nil, [[NSError alloc] init]);
              return;
          }
          
          NSString *lyricsResult = dictionary[@"lyrics_body"];
          
          completion(lyricsResult, nil);
          
      }]resume] ;
    
}

- (void)createSongWithName:(NSString *)name artist:(NSString *)artist rating:(NSInteger)rating lyrics:(NSString *)lyrics
{
    FAFSong *song = [[FAFSong alloc] initWithName:name lyrics:lyrics artist:artist rating:rating];
    
    [[self songs] addObject:song];
    //TODO: Add persistence by saving to file or CoreData?
}



@end
