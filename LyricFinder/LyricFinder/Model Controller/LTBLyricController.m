//
//  LTBLyricController.m
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBLyricController.h"
#import "LTBLyric+Convenience.h"
#import "LTBCoreDataStack.h"

@interface LTBLyricController ()

@property (nonatomic) NSMutableArray *internalLyrics;

@end

@implementation LTBLyricController

- (instancetype)init
{
    if (self = [super init]) {
        self.internalLyrics = [[NSMutableArray alloc] initWithArray:[self loadFromCoreData]]; //initWithArray?
    }
    return self;
}

- (NSArray<LTBLyric *> *)lyrics
{
    return [self.internalLyrics copy];
}

- (void)createWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics  rating:(NSInteger)rating
{
    LTBLyric *lyric = [[LTBLyric alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [self.internalLyrics addObject:lyric];
    
    [LTBCoreDataStack.sharedStack save];
}

- (void)updateLyric:(LTBLyric *)lyric title:(NSString *)title artist:(NSString *)artist
{
    lyric.title = title;
    lyric.artist = artist;
    
    [LTBCoreDataStack.sharedStack save];
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const apiKeyString = @"Xpm4NyR90JmsheFbs8RkBlEUhfOlp17X8LxjsnSU87EcxXEGqM";

- (void)loadLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *lyrics, NSError *error))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *q_artist = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    
    NSURLQueryItem *q_track = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    
    [components setQueryItems:@[q_artist, q_track]];
    
    NSURL *url = [components URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:apiKeyString forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error fetching data: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            return;
        }
        
        // if no data,...
        if (!data) {
            NSLog(@"Data is missing");
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, [[NSError alloc] init]);
            });
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        // make sure what we got back is actually a dictionary
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, [[NSError alloc] init]);
            });
            return;
        }
        
        NSString *lyrics = dictionary[@"lyrics_body"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(lyrics, nil);
        });
    }] resume];
}

- (NSArray<LTBLyric *> *)loadFromCoreData
{
    NSFetchRequest *fetchRequest = LTBLyric.fetchRequest;
    NSManagedObjectContext *moc = LTBCoreDataStack.sharedStack.mainContext;

    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:fetchRequest error:&error];
    if (!results) {
        NSLog(@"Error fetching lyrics objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }

    return results;
}

@end
