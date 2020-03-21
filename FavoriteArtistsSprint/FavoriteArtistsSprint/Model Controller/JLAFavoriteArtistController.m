//
//  JLAFavoriteArtistController.m
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLAFavoriteArtistController.h"
#import "JLAFavoriteArtist+NSJSONSerialization.h"
#import "JLAFavoriteArtist.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@interface JLAFavoriteArtistController()

/// This is where dreams are stored
@property (nonatomic) NSMutableArray *privateArtists;

@end

@implementation JLAFavoriteArtistController

- (void)fetchFavoriteArtistByName:(NSString *)strArtist completion:(void(^)(JLAFavoriteArtist *, NSError *error))completion {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    urlComponents.queryItems = @[
                                [NSURLQueryItem queryItemWithName:@"s" value:strArtist]
                                ];

    NSURL *url = urlComponents.URL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSLog(@"request = %@", request);
    
    // Data Task
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
        
        JLAFavoriteArtist *favoriteArtistData = [[JLAFavoriteArtist alloc] initWithDictionary:dictionary];
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

/// Returns private artists array
- (NSArray *)favoriteArtists {
    return self.privateArtists;
}

- (void)addArtistWithArtist:(NSString *)artist
                       year:(int)year
                        bio:(NSString *)bio {
    
    JLAFavoriteArtist *newArtist = [[JLAFavoriteArtist alloc] initWithStrArtist:artist
                                                                  intFormedYear:year
                                                                 strBiographyEN:bio];
    [self.privateArtists addObject:newArtist];
    [self saveToPersistentStore];
}

/// Documents URL
- (NSURL *)applicationDocumentsDirectory {
    // documentsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

/// favoriteArtists URL
- (NSURL *)favoriteArtistsURL {
    // itemsURL = documentsDir.appendingPathComponent("grillcountdown.plist")
    return [self.applicationDocumentsDirectory URLByAppendingPathComponent:@"favoriteArtists.json"];
}

- (void)saveToPersistentStore {
    NSLog(@"SAVE");
    // [ {}, {}, {}, ...]
    NSMutableArray *favoriteArtistsArray = [[NSMutableArray alloc] init];
    
    for (JLAFavoriteArtist *favoriteArtist in self.favoriteArtists) {
        // convert to dictionary/object
        NSDictionary *favoriteArtistDictionary = [favoriteArtist toDictionary];
        [favoriteArtistsArray addObject:favoriteArtistDictionary];
    }
    
    // let itemsData = try encoder.encode(events) // eventsArray
    NSData *favoriteArtistsData = [NSJSONSerialization dataWithJSONObject:favoriteArtistsArray options:0 error:nil];
    
    // try itemsData.write(to: fileURL)
    [favoriteArtistsData writeToURL:self.favoriteArtistsURL atomically:YES];
}

- (void)loadFromPersistentStore {
    NSLog(@"LOAD");
    // let itemsData = try Data(contentsOf: fileURL)
    NSData *favoriteArtistsData = [NSData dataWithContentsOfURL:self.favoriteArtistsURL];
    
    // let itemsArray = try decoder.decode([Event].self, from: itemsData)
    if (favoriteArtistsData) {
        
        NSArray *favoriteArtistsArray = [NSJSONSerialization JSONObjectWithData:favoriteArtistsData options:0 error:nil];
        
        // self.events = itemsArray
        for (NSDictionary *favoriteArtistDictionary in favoriteArtistsArray) {
            JLAFavoriteArtist *favoriteArtist = [[JLAFavoriteArtist alloc] initWithDict:favoriteArtistDictionary];
            [self.privateArtists addObject:favoriteArtist];
        }
    }
}

@end
