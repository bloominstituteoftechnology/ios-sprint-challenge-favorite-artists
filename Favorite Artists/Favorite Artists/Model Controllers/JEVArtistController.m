//
//  JEVArtistController.m
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import "JEVArtistController.h"
#import "JEVArtist+JSONSerialization.h"

@implementation JEVArtistController

static NSString *artistKey = @"artists";

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        _baseURL = [NSURL
                    URLWithString:@"https://www.theaudiodb.com/api/v1/json/1/search.php"];
        _privateArtists = [[self loadArtists] mutableCopy];
    }
    
    return self;
}

- (void)findArtistWithName:(NSString *)name
                completion:(void (^)(JEVArtist *))completion
{
    NSURLComponents *components = [NSURLComponents
                                   componentsWithURL:self.baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *nameQuery = [NSURLQueryItem queryItemWithName:@"s" value:name];
    components.queryItems = @[nameQuery];
    
    NSURL *requestURL = components.URL;
    NSMutableURLRequest *request = [NSMutableURLRequest
                                    requestWithURL:requestURL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable _, NSError * _Nullable error)
      {
        
        if (error)
            
        {
            NSLog(@"Error fetching artists: %@", error);
            completion(nil);
            return;
        }
        
        if (!data)
            
        {
            NSLog(@"Cannot fetch data: %@", data);
            completion(nil);
            return;
        }
        
        NSError *decodeError = nil;
        NSDictionary *decodedDictionary = [NSJSONSerialization
                                           JSONObjectWithData:data options:0 error:&decodeError];
        if (decodeError)
            
        {
            NSLog(@"Error decoding JSON: %@", decodeError);
            completion(nil);
            return;
        }
        
        if (decodedDictionary[artistKey] != [NSNull null])
            
        {
            NSDictionary *artistsDictionary = decodedDictionary[artistKey][0];
            
            if (!artistsDictionary)
                
            {
                NSLog(@"Error fetching dictionary");
                completion(nil);
                
            }
            
            else
                
            {
                JEVArtist *artist = [[JEVArtist alloc]
                                     initWithDictionary:artistsDictionary];
                completion(artist);
                return;
            }
            
        }
        
        else
            
        {
            NSLog(@"Cannot find artist.");
            completion(nil);
        }
    }] resume];
}

- (NSURL *)artistsURL
{
    NSURL *documentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentsDirectory URLByAppendingPathComponent:fileName];
}

- (void) saveArtist
{
    NSMutableArray *artistDict = [[NSMutableArray alloc] init];
    
    for (JEVArtist *artist in self.privateArtists)
        
    {
        
        [artistDict addObject:[artist createArtistDictionary]];
        
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:artistDict options:0 error:nil];
    [data writeToURL:[self artistsURL] atomically:YES];
}

- (void) addArtist:(JEVArtist *)artist
{
    [self.privateArtists addObject:artist];
    [self saveArtist];
}

- (NSArray *)loadArtists
{
    NSData *data = [NSData dataWithContentsOfURL:[self artistsURL]];
    
    if (!data)
        
    {
        
        NSLog(@"Cannot Find Data");
        return @[];
        
    }
    
    NSError *error = nil;
    NSArray *artistDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error)
        
    {
        
        NSLog(@"Error loading your artists!: %@", error);
        return @[];
        
    }
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (int j = 0; j < artistDict.count; j++)
        
    {
        
        NSDictionary *artistsDict = artistDict[j];
        JEVArtist *artist = [[JEVArtist alloc] initWithDictionary:artistsDict];
        [artists addObject:artist];
        
    }
    
    return artists;
}

- (NSArray *)artists
{
    return self.privateArtists;
}

@end
