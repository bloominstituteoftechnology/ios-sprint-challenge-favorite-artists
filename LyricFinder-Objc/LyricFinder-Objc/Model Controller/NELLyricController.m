//
//  NELLyricController.m
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELLyricController.h"
#import "NELLyric.h"
#import "NELLyric+NELNSJSONSerialization.h"

@interface NELLyricController()

-(void)saveToStorage;
-(void)getFromStorage;

@property (nonatomic) NSMutableArray *internalSongs;
@property (nonatomic) NSURL *lyricUrls;
@end

@implementation NELLyricController

- (instancetype)init
{
    self = [super init];
    if (self) {
        //Create an empty mutable array
        _internalSongs = [[NSMutableArray alloc] init];
        [self getFromStorage];

    }
    return self;
}


- (void)searchLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *baseUrl = [NSURL URLWithString:baseURLString];
    
     NSURLComponents *components = [NSURLComponents componentsWithURL:baseUrl resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *artistParam = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *titleParam = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    
    [components setQueryItems:@[artistParam, titleParam]];
    
   // NSURL *requestUrl = components.URL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:(components.URL)];
    [request setValue:apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    //Perform data task
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching lyrics: %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data returned from data task");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        //convert data to our model objects
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        //check to make sure that the dict is actually a dict
        if (![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            //if its not a dict.
            NSLog(@"Json was not dict");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *body = jsonDictionary[@"lyrics_body"];
        
        completion(body, nil);
        
    }];
    
    [dataTask resume];
}

- (void)addSongWithTitle:(NSString *)title artist:(NSString *)artist lyric:(NSString *)lyric rating:(int)rating
{
    NELLyric *songs = [[NELLyric alloc]initWithTitle:title artist:artist lyrics:lyric rating:rating];
    [self.internalSongs addObject:songs];
    [self saveToStorage];
}


- (void)saveToStorage
{
    NSMutableArray *songDicts = [[NSMutableArray alloc] init];

    for (NELLyric *lyrics in self.internalSongs) {
        [songDicts addObject:[lyrics dictionaryRepresentation]];
    }

    NSData *lyricData = [NSJSONSerialization dataWithJSONObject:songDicts options:0 error:nil];
    NSURL *documentsDir = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSURL *saveUrl = [documentsDir URLByAppendingPathComponent:@"lyrics"];
    
    [lyricData writeToURL:saveUrl atomically:YES];
}

- (void)getFromStorage
{
    NSURL *documentsDir = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSURL *loadContentsUrl = [documentsDir URLByAppendingPathComponent:@"lyrics"];
    
    NSData *data = [NSData dataWithContentsOfURL:loadContentsUrl];
    if (data) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        for (NSDictionary *dict in array) {
            NELLyric *lyrics = [[NELLyric alloc]intiWithDictionary:dict];
            [self.internalSongs addObject:lyrics];
        }
    }
    
}


- (NSArray *)songs
{
    return self.internalSongs;
}




static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const apiKey = @"76355494e5msh9027d9b4a109d10p1f700bjsnf2a2e407c6a1";
@end
