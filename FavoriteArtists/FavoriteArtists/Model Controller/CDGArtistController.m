//
//  CDGArtistController.m
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import "CDGArtistController.h"
#import "CDGArtist.h"
#import "CDGArtist+JSONSerialization.h"

@interface CDGArtistController()

@property (nonatomic, copy) NSMutableArray *internalArtistsArray;

@end

@implementation CDGArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtistsArray = [[self loadFavoriteArtists] mutableCopy];
    }
    return self;
}

static NSString *const baserURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForArtist:(NSString *)searchTerm completion:(void (^)(CDGArtist *artist, NSError *error))completion{
    NSURL *baseURL = [NSURL URLWithString:@"https://theaudiodb.com/api/v1/json/1/search.php"];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];

    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:searchTerm]
    ];

    NSURL *url = urlComponents.URL;

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error) {
            NSLog(@"Error searching with url: %@", error);
            completion(nil, error);
            return;
        }
        if (!data) {
            NSError *error;
            completion(nil, error);
            return;
        }
        NSError *responseError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0 error:&responseError];
        if (responseError) {
            completion(nil, error);
            return;
        }
        if (![json isKindOfClass:[NSDictionary class]]){
            completion(nil, [[NSError alloc]init]);
            return;
        }
        NSDictionary *artistsDictionary = [[json objectForKey:@"artists"] firstObject];
        if (artistsDictionary == nil ){
            completion(nil, [[NSError alloc]init]);
        }
        CDGArtist *artist = [[CDGArtist alloc] initWithDictionary:artistsDictionary];
        completion(artist, nil);
        
    }]
     resume];
}

- (void)addArtist:(CDGArtist *)artist {
    [self.internalArtistsArray addObject:artist];
    [self saveToDirectory];
    
}

- (void)saveToDirectory {
    NSMutableArray *artistDictionaries = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < self.internalArtistsArray.count; i++) {
        CDGArtist *artist = self.internalArtistsArray[i];
        [artistDictionaries addObject:[artist toDictionary]];
    }
    
    NSData *artistData = [NSJSONSerialization dataWithJSONObject:artistDictionaries options:0 error:nil];
    [artistData writeToURL:[self artistsFileURL] atomically:YES];
    
}

- (NSArray *)artistsArray {
    return self.internalArtistsArray;
}

- (NSURL *)artistsFileURL
{
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}


- (NSArray *)loadFavoriteArtists{
    
    
    NSData *artistsData = [NSData dataWithContentsOfURL:[self artistsFileURL]];
    if (!artistsData) { return @[]; }
    NSError *error = nil;
    NSArray *artistDictionaries = [NSJSONSerialization JSONObjectWithData:artistsData options:0 error:&error];
    if (error) {
        NSLog(@"Error loading saved artists: %@", error);
        return @[];
    }
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    for (int i = 0; i < artistDictionaries.count; i++) {
        NSDictionary *artistDictionary = artistDictionaries[i];
        CDGArtist *artist = [[CDGArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }
    return artists;
}

@end
