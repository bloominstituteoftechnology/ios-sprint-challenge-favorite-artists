//
//  SMFSongController.m
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "SMFSongController.h"
#import "SMFCoreDataStack.h"
#import "SMFSong+SMFConvenience.h"

#pragma mark Extension
@interface SMFSongController ()

@property (readwrite) NSManagedObjectContext *moc;

@end

#pragma mark - Implementation
@implementation SMFSongController

#pragma mark - Static properties
static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const apiKey = @"M6hNpOsGrGmshbZ8nzvPlPwkNO12p1bpAvJjsnYjVcf0DgeXIB";

#pragma mark - Initializer
- (instancetype)init
{
    self = [super init];
    if (self) {
        _moc = [[[[SMFCoreDataStack alloc] init] container] viewContext];
    }
    return self;
}

#pragma mark - CoreData
- (void)saveToCoreData {
    NSError *error = nil;
    if ([self.moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

#pragma mark - Networking (API)
- (void)fetchSongLyricsWithTitle:(NSString *)title artist:(NSString *)artist completionHandler:(void (^)(NSString *lyrics, NSError *error))completionHandler {
    #pragma mark URL construction
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *titleQuery = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    NSURLQueryItem *artistQuery = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    [urlComponents setQueryItems:@[artistQuery, titleQuery]];
    NSURL *url = [urlComponents URL];
    
    #pragma mark Request construction
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    #pragma mark NSURLSession
    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *r, NSError *error) {
        #pragma mark Error handling
        if (error) {
            NSLog(@"Error fetching song lyrics %@", error);
            completionHandler(nil, error);
            return;
        }
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completionHandler(nil, [[NSError alloc] init]);
            return;
        }
        #pragma mark JSON parsing
        NSString *lyrics = dictionary[@"lyrics_body"];
        
        completionHandler(lyrics, nil);
    }] resume];
}

#pragma mark - CRUD
- (void)createWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating {
    __unused SMFSong *s = [[SMFSong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating context:self.moc];
    [self saveToCoreData];
}
- (void)updateSong:(SMFSong *)song rating:(NSInteger)rating {
    song.rating = rating;
    [self saveToCoreData];
}
- (void)deleteSong:(SMFSong *)song {
    [self.moc deleteObject:song];
    [self saveToCoreData];
}

@end
