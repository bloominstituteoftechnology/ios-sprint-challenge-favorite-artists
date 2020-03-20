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

// Private
@property (nonatomic) NSMutableArray<JLAFavoriteArtist *> *privateArtists;

@end

@implementation JLAFavoriteArtistController

- (void)fetchFavoriteArtistByName:(NSString *)strArtist completion:(void(^)(JLAFavoriteArtist *))completion {
    
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
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error returned from data task");
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
        
        if(!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error: Expected top level dictionary in JSON result: %@", error);
            completion(nil);
            return;
        }
        
        NSLog(@"Dictionary: %@", dictionary);
        
        JLAFavoriteArtist *favoriteArtistData = [[JLAFavoriteArtist alloc] initWithDictionary:dictionary];
        completion(favoriteArtistData);
    }] resume];
}

- (instancetype)init {
    
    if (self = [super init]) {
        _privateArtists = [[NSMutableArray alloc] init];
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
    NSLog(@"added to array: %@", newArtist.strArtist);
    NSLog(@"arists array last added: %@", self.privateArtists[0]);
    NSLog(@"privateArtists.count: %i", self.privateArtists.count);
}

@end
