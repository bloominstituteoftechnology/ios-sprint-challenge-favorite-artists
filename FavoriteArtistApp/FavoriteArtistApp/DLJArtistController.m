//
//  DLJArtistController.m
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJArtistController.h"
#import "DLJArtist.h"
#import "DLJJSONSerialization.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";
static NSString *apiKey = @"1";

@interface DLJArtistController()
@property (nonatomic) NSMutableArray *internalArtists;

@end

@implementation DLJArtistController

-(instancetype)init {
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];

    }

    return self;
}

- (void)saveArtist:(DLJArtist *)artist {
    [self.internalArtists addObject:artist];
}



}

- (void)fetchArtistsWithName:(NSString *)name completion:(DLJCompletionBlock)completion {

    // Need base URL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];

    // Make components
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];

    // Query Items
    NSURLQueryItem *queryItems = [[NSURLQueryItem alloc] initWithName:@"s" value:name];

    [urlComponents setQueryItems:@[queryItems]];

    // create URLRequest

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlComponents.URL];

    //URLSession dataTask

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist from dataTask: %@", error);
            completion(nil, error);
            return;
        }

        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        NSArray *dictionary = json[@"artists"];
        DLJArtist *artist = [[DLJArtist alloc] initWithDictionary:dictionary[0]];
        completion(artist, nil);

    }];

    [dataTask resume];
}




@end
