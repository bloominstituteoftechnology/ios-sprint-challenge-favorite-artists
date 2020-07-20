//
//  HMRArtistController.m
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import "HMRArtistController.h"
#import "HMRArtist.h"
#import "HMRArtist+NSJSONSerialization.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@interface HMRArtistController()

@property (nonatomic) NSMutableArray *privateArtists;

@end

@implementation HMRArtistController

- (void)favoriteArtistForName:(NSString *)artist completion:(void(^)(HMRArtist *, NSError *error))completion {

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];

    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:artist]
    ];

    NSURL *url = urlComponents.URL;

    // Set up URLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"Get";
    NSLog(@"request = %@", request);

    // Data Task
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data,
                                                                                   NSURLResponse * _Nullable response,
                                                                                   NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error fetching artist data: %@", error);
            completion(nil, error);
            return;
        }

        if (!data) {
            NSLog(@"Error returned from data task");
            completion(nil, error);
            return;
        }

        // Decode the data using NSJSONSerialization
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            NSLog(@"Error decoding JSON from data: %@", error);
            completion(nil, jsonError);
            return;
        }

        if(!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error: Expected top level dictionary in JSON result: %@", error);
            completion(nil, error);
            return;
        }

        NSLog(@"Dictionary: %@", dictionary);

        if (dictionary[@"artists"] == nil) {
            NSLog(@"dictionary artists 71 controller: null");
            completion(nil, error);
            return;
        }

        HMRArtist *artistResults = [[HMRArtist alloc] initWithDictionary:dictionary];
        completion(artistResults, nil);
    }] resume];
}


- (instancetype)init {

    if (self = [super init]) {
        _privateArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)favoriteArtists {
    return self.privateArtists;
}

- (void)addArtist:(NSString *)artist
                       year:(int)year
                        bio:(NSString *)bio {

    HMRArtist *newArtist = [[HMRArtist alloc] initWithArtist:artist yearFormed:year biography:bio];
    [self.privateArtists addObject:newArtist];

}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

- (NSURL *)favoriteArtistsURL {
    return [self.applicationDocumentsDirectory URLByAppendingPathComponent:@"favoriteArtists.json"];
}

@end
