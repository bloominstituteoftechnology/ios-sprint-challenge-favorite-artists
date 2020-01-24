//
//  NMKArtistController.m
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKArtistController.h"
#import "NMKArtist.h"
#import "NSJSONSerialization+NMKArtist.h"

@interface NMKArtistController()

@property (nonatomic) NSMutableArray<NMKArtist *> *internalArtists;

@end

@implementation NMKArtistController

static NSString *const baseURLString = @"https://theaudiodb.com/api/v1/json/";
static NSString *const apiKey = @"1";

static NSString *const fullBaseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php"; // solved error


- (instancetype)init {
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchArtist:(NSString *)searchTerm completion:(void (^)(NMKArtist *, NSError *))completion {
//    NSURL *baseURL = [NSURL URLWithString:baseURLString];
//    NSURL *fullURL = [[baseURL URLByAppendingPathComponent:apiKey] URLByAppendingPathComponent:@"search.php"];
//
//    NSURLComponents *components = [NSURLComponents componentsWithURL:fullURL resolvingAgainstBaseURL:YES];
//    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:searchTerm];
//    [components setQueryItems:@[searchItem]];
    
    NSURLComponents *fullURLComponent = [[NSURLComponents alloc] initWithString:fullBaseURLString];
       
    NSMutableArray *queryItems = [NSMutableArray arrayWithObjects:
                                     [NSURLQueryItem queryItemWithName:@"s" value:searchTerm], nil];
    
    fullURLComponent.queryItems = queryItems;
    NSURL *url = fullURLComponent.URL;
    
//    NSLog(@"URL: %@", searchURL);
//    NSURLRequest *request = [NSURLRequest requestWithURL:searchURL];
    
        [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error fetching artist: %@", error);
                completion(nil, error);
                return;
            }
            
            NSError *jsonError = nil;
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (!results) {
                NSLog(@"Error decoding json: %@", jsonError);
                completion(nil, jsonError);
                return;
            }
            
            NSLog(@"%@", results);
            NSDictionary *resultArtist = [results objectForKey:@"artists"][0];
            
            NMKArtist *newArtist = [[NMKArtist alloc] initWithDictionary:resultArtist];
            completion(newArtist, nil);
        }] resume];
    }

- (void)saveArtist {
    {
        NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"artists.plist"];
        
        NSMutableArray *artistDictionaries = [[NSMutableArray alloc] init];
        
        for (NMKArtist *artist in self.internalArtists) {
            [artistDictionaries addObject:[artist toDictionary]];
        }
        
        NSDictionary *dictionary = @{@"artists":artistDictionaries};
        
        [dictionary writeToURL:documentDirectory atomically:YES];
    }
}

- (void)loadArtist {
    {
        NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"artists.plist"];
        
        NSMutableArray *artistDictionaries = [[NSDictionary alloc] initWithContentsOfURL:documentDirectory][@"artists"];
        
        for (NSDictionary *dictionary in artistDictionaries) {
            NMKArtist *artist = [[NMKArtist alloc] initWithDictionary:dictionary];
            [self.internalArtists addObject:artist];
        }
    }
}

- (void)addArtist:(NMKArtist *)anArtist {
    [self.internalArtists addObject:anArtist];
    [self saveArtist];
}

- (NSArray<NMKArtist *> *)artists
{
    return [self.internalArtists copy];
}

@end
