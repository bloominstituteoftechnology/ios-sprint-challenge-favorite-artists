//
//  NNEArtistController.m
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import "NNEArtistController.h"
#import "NNEArtist+NSJSONSerialization.h"
#import "NNEArtist.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@interface NNEArtistController() {}

@property (nonatomic) NSMutableArray *privateArtists;

@end

@implementation NNEArtistController

- (void)fetchArtistByName:(NSString *)artist completion:(void(^)(NNEArtist *, NSError *error))completion {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    urlComponents.queryItems = @[
                                [NSURLQueryItem queryItemWithName:@"s" value:artist]
                                ];

    NSURL *url = urlComponents.URL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSLog(@"request = %@", request);
    

    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data,
                                                                                   NSURLResponse * _Nullable response,
                                                                                   NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching artist data: %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"Error returned from data task");
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Error decoding JSON from data: %@", error);
            completion(nil, jsonError);
            return;
        }
        
        if(!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error: Expected top level dictionary in JSON result: %@", error);
            completion(nil, error);
            return;
        }
        
        NSLog(@"Dictionary: %@", dictionary);
        
        if (dictionary[@"artists"] == nil) {
            NSLog(@"dictionary artists 71 controller: null");
            completion(nil, error);
            return;
        }
        
        NNEArtist *favoriteArtistData = [[NNEArtist alloc] initWithDictionary:dictionary];
        completion(favoriteArtistData, nil);
    }] resume];
}

/// inits its array and thens load from documents
- (instancetype)init {
    
    if (self = [super init]) {
        _privateArtists = [[NSMutableArray alloc] init];
        [self loadFromPersistentStore];
    }
    return self;
}

- (NSArray *)myArtists {
    return self.privateArtists;
}

- (void)addArtistWithArtist:(NSString *)artist
                       year:(int)year
                        bio:(NSString *)bio {
    
    NNEArtist *newArtist = [[NNEArtist alloc] initWithartist:artist
                                                                  yearFormed:year
                                                                 biography:bio];
    [self.privateArtists addObject:newArtist];
    [self saveToPersistentStore];
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

- (NSURL *)artistURL {
    // itemsURL = documentsDir.appendingPathComponent("grillcountdown.plist")
    return [self.applicationDocumentsDirectory URLByAppendingPathComponent:@"favoriteArtists.json"];
}

- (void)saveToPersistentStore {
    NSLog(@"Saved!");
    NSMutableArray *artistArray = [[NSMutableArray alloc] init];
    
    for (NNEArtist *myArtist in self.myArtists) {

        NSDictionary *favoriteArtistDictionary = [myArtist toDictionary];
        [artistArray addObject:favoriteArtistDictionary];
    }

    NSData *favoriteArtistsData = [NSJSONSerialization dataWithJSONObject:artistArray options:0 error:nil];
    

    [favoriteArtistsData writeToURL:self.artistURL atomically:YES];
}

- (void)loadFromPersistentStore {
    NSLog(@"Load");
    NSData *artistData = [NSData dataWithContentsOfURL:self.artistURL];
    
    if (artistData) {
        
        NSArray *favoriteArtistsArray = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];

        for (NSDictionary *artistDictionary in favoriteArtistsArray) {
            NNEArtist *favoriteArtist = [[NNEArtist alloc] initWithDict:artistDictionary];
            [self.privateArtists addObject:favoriteArtist];
        }
    }
}

@end
