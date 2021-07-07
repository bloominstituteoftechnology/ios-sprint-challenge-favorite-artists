//
//  JTMLongLyricsController.m
//  Lyric Finder
//
//  Created by Jonathan T. Miles on 10/5/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMLongLyricsController.h"

@interface JTMLongLyricsController ()

@property (nonatomic) NSMutableArray *internalLyricsDictionaries;

@property NSFileManager *fileManager;

@end

@implementation JTMLongLyricsController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalLyricsDictionaries = [[NSMutableArray alloc] init];
        _fileManager = [NSFileManager defaultManager];
    }
    return self;
}

// MARK: Networking

-(void)searchForLyricsWithSongTitle:(NSString *)title byArtist:(NSString *)artist completionHandler:(void (^)(JTMSongLyrics *, NSError *))completion
{
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchArtist = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *searchTitle = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    
    [components setQueryItems:@[searchArtist, searchTitle]];
    NSURL *url = [components URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:@"dZ5pJldpLRmsh74FcLkkjAvtFm8Zp1bYMTnjsn1MKkJ9uxxDpF" forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        
    }] resume];
    
}

// MARK: Backing Management

-(void)saveNewLyricFromDictionary:(NSDictionary *)dictionary
{
    [_internalLyricsDictionaries addObject:dictionary];
}

-(NSArray *)lyricsDictionaries
{
    return [[self lyricsDictionaries] copy];
}

// MARK: Persistence

- (void)saveToPersistentStore
{
    // pseudo code for saving using self.fileManager:
    // save a path as a const from homeDirectoryForCurrentUser
    // create a data object from JSON serialization
    // call createFileAtPath:contents:attributes:
    // this saves over the file if it already exists
}

-(void)loadFromPersistentStore
{
    // use self.fileManager
    // call contentsAtPath:
    // which returns a data object
    // call restoreFromDictionary on the model for each entry in the array
    // probably also work in real JSONSerialization somewhere
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";

@end
