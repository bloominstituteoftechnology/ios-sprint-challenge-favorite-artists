//
//  ArtistFetcher.m
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import "ArtistFetcher.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation ArtistFetcher

-(void)fetchArtist:(NSString *)artistName WithCompletionHandler:(ArtistFetcherCompletionHandler)completionHandler
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:artistName],
    ];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"Artist fetching url is: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error) {
            NSLog(@"Error getting artist info: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (!dictionary) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
        }
        
        NSLog(@"%@", dictionary);
        
        Artist *artist = [[Artist alloc] initWithDictionary:dictionary];
        
        NSLog(@"%@", artist.artistName);
        NSLog(@"%d", artist.yearFounded);
        NSLog(@"%@", artist.artistBio);
        


        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(artist, nil);
        });
        
    }] resume];
}


- (void)createOrLoadArtistDictionary
{
    NSFileManager *fileManager = [NSFileManager new];
    NSError *error = nil;
    NSURL *docsURL = [fileManager URLForDirectory:NSDocumentDirectory
                                         inDomain:NSUserDomainMask
                                appropriateForURL:nil
                                           create:YES
                                            error:&error];
    if (!error) {
        NSURL *artistDictionaryURL = [docsURL URLByAppendingPathComponent:@"Artists"];
        NSLog(@"%@", artistDictionaryURL);
        
        if (![fileManager fileExistsAtPath:artistDictionaryURL.path]) {
            [fileManager createDirectoryAtURL:artistDictionaryURL withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                error = [self saveDictionaryWithUrl:artistDictionaryURL];
                if (error) {
                    NSLog(@"Error: %@, writing dictionary to path: %@", error, artistDictionaryURL);
                }
            }
        } else {
            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:artistDictionaryURL error:&error];
            NSLog(@"%@", dictionary);
        }
    }
}


- (NSError *)saveDictionaryWithUrl:(NSURL *)url
{
    Artist *testArtist = [[Artist alloc] initWithArtistName:@"Test" yearFounded:1999 artistBio:@"This is a test artist"];
    Artist *anotherArtist = [[Artist alloc] initWithArtistName:@"Test 2" yearFounded:1989 artistBio:@"This is a another test artist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:testArtist, testArtist.artistName, anotherArtist, anotherArtist.artistName, nil];
    
    NSError *error = nil;
    [dictionary writeToURL:url error:&error];
    
    if (!error) {
        self.localArtistDictionary = dictionary;
        self.allArtists = [[NSMutableArray alloc] initWithArray:self.localArtistDictionary.allValues];
        return nil;
    } else {
        return error;
    }
}


@end
