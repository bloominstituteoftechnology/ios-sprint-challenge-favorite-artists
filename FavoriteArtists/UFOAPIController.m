//
//  UFOAPIController.m
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "UFOAPIController.h"
#import "UFOArtist.h"
#import "UFOArtist+NSJSONSerialization.h"

@interface UFOAPIController ()

@property (nonatomic, copy) NSMutableArray *internalArtists;

@end

@implementation UFOAPIController

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalArtists = [[self loadArtists] mutableCopy ];
    }
    return self;
}

- (void)searchArtistWithStrArtist:(NSString *) strArtist completion: (void(^)(UFOArtist *))completion {
    
    NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php?";
    NSURL *url = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:true];
    NSURLQueryItem *artistItem = [NSURLQueryItem queryItemWithName:@"s" value:strArtist];
    components.queryItems = @[artistItem];
    
    NSURL *requestUrl = components.URL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"No data: %@", data);
            completion(nil);
            return;
        }
        
        error = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            NSLog(@"Error decoding JSON: %@", error);
            completion(nil);
            return;
        }
        
        if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"expected dictionary: %@", error);
            completion(nil);
            return;
        }
        
        if (dictionary[@"artists"] == [NSNull null]) {
            NSLog(@"expected artist array: %@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *artistDictionary = [dictionary[@"artists"] firstObject];
        UFOArtist *artist = [[UFOArtist alloc] initWithDictionary:artistDictionary];
        completion(artist);
        
    }] resume];
}

- (NSArray *)artists {
    return self.internalArtists;
}

- (void)addArtist:(UFOArtist *)artist {
    [self.internalArtists addObject:artist];
    [self saveArtists];
}

- (NSURL *)artistsFileURL
{
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)saveArtists{
    
    NSMutableArray *artistDictionaries = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.internalArtists.count; i++) {
        UFOArtist *artist = self.internalArtists[i];
        [artistDictionaries addObject:[artist toDictionary]];
    }
    NSData *artistData = [NSJSONSerialization dataWithJSONObject:artistDictionaries options:0 error:nil];
    [artistData writeToURL:[self artistsFileURL] atomically:YES];
    
}

- (NSArray *)loadArtists {
    NSData *artistsData = [NSData dataWithContentsOfURL:[self artistsFileURL]];
    if (!artistsData) { return @[]; }
    
    NSError *error = nil;
    NSArray *artistDictionaries = [NSJSONSerialization JSONObjectWithData:artistsData options:0 error:&error];
    if (error) {
        NSLog(@"Error loading artists: %@", error);
        return @[];
    }
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    for (int i = 0; i < artistDictionaries.count; i++) {
        NSDictionary *artistsDict = artistDictionaries[i];
        UFOArtist *artist = [[UFOArtist alloc] initWithDictionary:artistsDict];
        [artists addObject:artist];
    }
    return artists;
}

@end
