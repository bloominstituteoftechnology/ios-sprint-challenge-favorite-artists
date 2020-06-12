//
//  HSIArtistController.m
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import "HSIArtistController.h"
#import "HSIArtist+NSJSONSerialization.h"

@implementation HSIArtistController

static NSString *artistKey = @"artists";

- (instancetype) init
{
    self = [super init];

    if (self) {
        _baseURL = [NSURL URLWithString:@"https://www.theaudiodb.com/api/v1/json/1/search.php"];
        _privateArtists = [[self loadArtists] mutableCopy];
    }
    
    return self;
}

- (void)findArtistWithName:(NSString *)name
                completion:(void (^)(HSIArtist *))completion
{
    NSURLComponents *components = [NSURLComponents componentsWithURL:self.baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *nameQuery = [NSURLQueryItem queryItemWithName:@"s" value:name]; //?s=name
    components.queryItems = @[nameQuery];

    NSURL *requestURL = components.URL;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];

    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable _, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completion(nil);
            return;
        }

        if (!data) {
            NSLog(@"No data from findArtistWithName");
            completion(nil);
            return;
        }

        NSError *decodeError = nil;
        NSDictionary *decodeDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&decodeError];
        if (decodeError) {
            NSLog(@"Error decoding JSON data: %@", decodeError);
            completion(nil);
            return;
        }
        
        if (decodeDictionary[artistKey] != [NSNull null]) {
            NSDictionary *artistsDictionary = decodeDictionary[artistKey][0];
            if (!artistsDictionary) {
                NSLog(@"Error creating dictionary.");
                completion(nil);
            } else {
                HSIArtist *artist = [[HSIArtist alloc] initWithDictionary:artistsDictionary];
                completion(artist);
                return;
            }
        } else {
            NSLog(@"No artists found.");
            completion(nil);
        }


    }] resume];
}

- (NSURL *)artistsFileURL
{
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)addArtist:(HSIArtist *)artist
{
    [self.privateArtists addObject:artist];
    [self saveArtists];
}

- (void)saveArtists
{
    NSMutableArray *artistDictionary = [[NSMutableArray alloc] init];

    for (HSIArtist *artist in self.privateArtists) {
        [artistDictionary addObject: [artist toDictionary]];
    }

    NSData *artistData = [NSJSONSerialization dataWithJSONObject:artistDictionary options:0 error:nil];
    [artistData writeToURL:[self artistsFileURL] atomically:YES];
}

- (NSArray *)loadArtists
{
    NSData *artistData = [NSData dataWithContentsOfURL:[self artistsFileURL]];
    if (!artistData) {
        NSLog(@"No data found. Has any been saved yet?");
        return @[];
    }

    NSError *loadError = nil;
    NSArray *artistDictionaries = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:&loadError];
    if (loadError) {
        NSLog(@"Error loading saved artists: %@", loadError);
        return @[];
    }

    NSMutableArray *artists = [[NSMutableArray alloc] init];
    for (int i = 0; i < artistDictionaries.count; i++) {
        NSDictionary *artistDictionary = artistDictionaries[i];
        HSIArtist *artist = [[HSIArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }
    
    return artists;
}

@end
