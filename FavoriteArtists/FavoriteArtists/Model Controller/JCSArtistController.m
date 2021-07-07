//
//  JCSArtistController.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import "JCSArtistController.h"
#import "JCSArtist.h"
#import "JCSFileOps.h"
//#import "JCSArtistDetailViewController.h"

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

@interface JCSArtistController ()

@property (nonatomic, copy) NSMutableArray *internalArtists;
@property (nonatomic, copy) NSMutableArray *savedInternalArtists;
@property (nonatomic, copy) NSMutableArray *persistentStoreArtists;

@end

@implementation JCSArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
        _savedInternalArtists = [[NSMutableArray alloc] init];
        _persistentStoreArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

// METHODS

- (void)addNewArtist:(JCSArtist *)artist {
    [self.savedInternalArtists addObject:artist];
    JCSFileOps *files = [[JCSFileOps alloc] init];
    NSString *storeArtist = [NSString stringWithFormat:@"%@  %d  %@", artist.artistName, artist.yearFormed, artist.biography];
    [files WriteToStringFile:[storeArtist mutableCopy]];
}

- (void)loadFromPersistentStore {
    JCSFileOps *readFile = [[JCSFileOps alloc] init];
    NSLog(@"Persistent Store: %@", [readFile readFromFile]);
    NSArray * arr = [[readFile readFromFile] componentsSeparatedByString:@"  "];
    NSString *name = arr[0];
    NSString *bio = arr[2];
    int year = (int)[arr[1] integerValue];
    JCSArtist *art = [[JCSArtist alloc] initWithName:name bio:bio yearFormed:year];
    [self.savedInternalArtists addObject:art];
   /* for (NSString *txt in readFile) {
        NSArray * arr = [txt componentsSeparatedByString:@"  "];
        NSString *name = arr[0];
        NSString *bio = arr[3];
        int year = (int)[arr[1] integerValue];
        JCSArtist *art = [[JCSArtist alloc] initWithName:name bio:bio yearFormed:year];
        [self.savedInternalArtists addObject:art];
    }*/
    
}

//- (void)fetchArtistByName:(NSString *)name completion:(void (^)(NSError *))completion {
- (void)fetchArtistByName:(NSString *)name completion:(void (^)(NSError *))completion;
{
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    // Query parameters
    
    NSMutableArray *queryItems = [@[[NSURLQueryItem queryItemWithName:@"s" value:name]] mutableCopy];
    
    urlComponents.queryItems = queryItems;
    
    // URL
    NSURL *url = urlComponents.URL;
    
    // Datatask
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Error
        if (error) {
            NSLog(@"Error fetching artists: %@", error);
            completion(error);
            return;
        }
        
        // Parse
        NSError *jsonError;
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!dictionary) {
            NSLog(@"Error decoding: %@", error);
            completion(error);
            return;
        }
        
        NSArray *artistDictionaries = dictionary[@"artists"];
        NSMutableArray *artists = [[NSMutableArray alloc] init];
        
        NSString *artistName = dictionary[@"strArtist"];
        NSLog(@"Artist name from json: %@", artistName);
        
        for (NSDictionary *dict in artistDictionaries) {
            JCSArtist *artist = [[JCSArtist alloc] initWithName:artistName dictionary:dict];
            
            [artists addObject:artist];
        }
        self.internalArtists = artists;
        NSLog(@"Artists: %@", artists);
        completion(nil);
    }];
    [task resume];
    
}

- (NSArray *)savedArtists
{
    return self.savedInternalArtists;
}
- (NSArray *)foundArtists
{
    return self.internalArtists;
}

@end
