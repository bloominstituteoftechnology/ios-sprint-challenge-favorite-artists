//
//  ArtistController.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "ArtistController.h"
#import "Artist+NSJSONSerialization.h"

@implementation ArtistController

- (void)fetchJson:(completionHandler)completion {
    NSURL *url = [NSURL URLWithString:@"https://www.theaudiodb.com/api/v1/json/1/search.php?s=macklemore"];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { completion(nil, response, error); }
        if (!data) { completion(nil, response, error); }
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        completion(dictionary, response, nil);
    }];
    [task resume];
}

- (void)getArtist:(NSString *)name
       completion:(void (^)(Artist *))completion {
    [self fetchJson:^(NSDictionary * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion([[Artist new] initWithDictionary:data]);
    }];
}

@end
