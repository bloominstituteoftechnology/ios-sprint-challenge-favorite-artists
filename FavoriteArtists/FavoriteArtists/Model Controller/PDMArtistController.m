//
//  PDMArtistController.m
//  FavoriteArtists
//
//  Created by Patrick Millet on 6/12/20.
//  Copyright © 2020 PatrickMillet79. All rights reserved.
//

#import "PDMArtistController.h"
#import "PDMArtist.h"
#import "PDMArtist+JSONSerialization.h"

@interface PDMArtistController ()

@property (nonatomic, copy) NSMutableArray *internalArtists;

@end

@implementation PDMArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[self loadArtists] mutableCopy];
    }
    return self;
}

- (void)searchForArtistWithName:(NSString *)name completion:(void (^)(PDMArtist *))completion
{
    NSURL *baseURL = [NSURL URLWithString:@"https://www.theaudiodb.com/api/v1/json/1/search.php"];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *artistItem = [NSURLQueryItem queryItemWithName:@"s" value:name];
    components.queryItems = @[artistItem];
    
    NSURL *requestURL = components.URL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching artist: %@.", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"No data from artist fetch");
            completion(nil);
            return;
        }
        
        error = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            NSLog(@"Error decoding JSON from data: %@", error);
            completion(nil);
            return;
        }
        
        if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error: Expected top level dictionary in JSON result: %@", error);
            completion(nil);
            return;
        }
        
        NSLog(@"Dictionary: %@", dictionary);
        if (dictionary[@"artists"] == [NSNull null]) {
            NSLog(@"Error: No artists found for search term: %@", name);
            completion(nil);
            return;
        }
        
        NSDictionary *artistDictionary = [dictionary[@"artists"] firstObject];
        PDMArtist *artist = [[PDMArtist alloc] initWithDictionary:artistDictionary];
        completion(artist);
        
    }] resume];
}

- (void)addArtist:(PDMArtist *)artist
{
    [self.internalArtists addObject:artist];
    [self saveArtists];
}

- (NSURL *)artistsFileURL
{
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)saveArtists
{
    NSMutableArray *artistDictionaries = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.internalArtists.count; i++) {
        PDMArtist *artist = self.internalArtists[i];
        [artistDictionaries addObject: [artist toDictionary]];
    }
    
    NSData *artistsData = [NSJSONSerialization dataWithJSONObject:artistDictionaries options:0 error:nil];
    [artistsData writeToURL:[self artistsFileURL] atomically:YES];
}

- (NSArray *)loadArtists
{
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
        PDMArtist *artist = [[PDMArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }
    
    return artists;
}

- (NSArray *)artists
{
    return self.internalArtists;
}

@end
