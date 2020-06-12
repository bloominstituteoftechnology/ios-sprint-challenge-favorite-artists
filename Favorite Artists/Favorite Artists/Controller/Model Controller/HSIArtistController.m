//
//  HSIArtistController.m
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import "HSIArtistController.h"

@implementation HSIArtistController

- (instancetype) init
{
    self = [super init];

    if (self) {
        _baseURL = [NSURL URLWithString:@"https://www.theaudiodb.com/api/v1/json/1/search.php"];
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

        NSDictionary *artistsDictionary = decodeDictionary[@"artists"];
        if (!artistsDictionary) {
            NSLog(@"Error creating dictionary. No artists found?");
        } else {
            // TODO: Create artist init from dictionary, complete artist
            completion(nil);
            return;
        }

        completion(nil);
    }] resume];
}

@end
