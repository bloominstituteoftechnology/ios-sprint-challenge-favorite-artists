//
//  ArtistController.m
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"
@interface ArtistController()

@property NSMutableArray *internalArtists;
@end

@implementation ArtistController

//MARK: properties
- (NSArray *)artists {
    return [self.internalArtists copy];
}

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s";

// MARK: initializers
- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

//MARK: Methods
- (void)fetchArtistWithName:(NSString *)name completion:(void (^)(NSError *error, Artist *createdArtist))completion {
   // NSURL *artistURl = [NSURL URLWithString:baseURL];
    NSURL *baseurl = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseurl resolvingAgainstBaseURL:true];
    NSURLQueryItem *search = [NSURLQueryItem queryItemWithName:@"s" value:name];
    components.queryItems = @[search];
    NSLog(@"%@",components.URL);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:components.URL];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error fetching json: %@", error);
            completion(error, nil);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, nil);
            return;
        }
        
        if(![json isKindOfClass:[NSDictionary class]]){
            NSLog(@"json was not a dictionary as expected");
            completion([[NSError alloc] init], nil);
            return;
        }
        
        
        NSArray *fetchedResults = json[@"artists"];
        NSMutableArray *fetchedArtists = [[NSMutableArray alloc] init];
        Artist *fetchedArtist = [[Artist alloc] init];
        NSMutableDictionary *newDictionary = [[NSMutableDictionary alloc] init];
        
        for (NSDictionary *artistDictionary in fetchedResults) {
            
            if ([[artistDictionary valueForKey:@"intFormedYear"]  isEqual: [NSNull null]]) {
                [newDictionary setValue: @"0" forKey:@"intFormedYear"];
                
                [newDictionary setValue:[artistDictionary valueForKey:@"strArtist"] forKey:@"strArtist"];
                [newDictionary setValue:[artistDictionary valueForKey:@"strBiographyEN"] forKey:@"strBiographyEN"];
                NSLog(@"%@", newDictionary);
                Artist *artist = [[Artist alloc] initWithDictionary:newDictionary];
                fetchedArtist = artist;
                [fetchedArtists addObject:artist];
                completion(nil, artist);
                return ;
            } else {
                Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];
                fetchedArtist = artist;
                NSLog(@"%@", artist);
                [fetchedArtists addObject:artist];
            }

        }
       // [self.internalArtists addObjectsFromArray:fetchedArtists];
       // NSLog(@"%lu",(unsigned long)self.artists.count);
        completion(nil, fetchedArtist);
        
    }];
    [dataTask resume];
    
}
- (void)createArtistWithName:(NSString *)name yearFormed:(int)yearFormed biography:(NSString *)biography {
    Artist *artist = [[Artist alloc] initWithArtistName:name yearFormed:yearFormed biography:biography];
    [self.internalArtists addObject:artist];
    [self saveToUserDefaults:artist];
    
}

- (void)loadFromUserDefaults {
     NSMutableArray *savedArtists = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"artists"]];
    for (NSDictionary *artistDictionary in savedArtists) {
        Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];
        [[self internalArtists] addObject:artist];
    }
}

- (void)saveToUserDefaults:(Artist *)artist {
    NSMutableArray *savedArtists = [[NSMutableArray alloc] init];
    NSMutableDictionary *artistDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray *existingArtists = [[NSUserDefaults standardUserDefaults] objectForKey:@"artists"];
    [savedArtists addObjectsFromArray:existingArtists];
    NSString *yearFormed = [NSString stringWithFormat:@"%d", artist.yearFormed];
    
    [artistDictionary setValue:artist.artistName forKey:@"strArtist"];
    [artistDictionary setValue: yearFormed forKey:@"intFormedYear"];
    [artistDictionary setValue:artist.biography forKey:@"strBiographyEN"];

    [savedArtists addObject:artistDictionary];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:savedArtists forKey:@"artists"];
}
- (void)deleteArtist:(Artist *)artist {
    
}

@end
