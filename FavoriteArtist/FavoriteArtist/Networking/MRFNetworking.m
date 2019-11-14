//
//  MRFNetworking.m
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFNetworking.h"
#import "MRFArtist.h"
#import "MRFArtist+MRFJSONSerialization.h"

@implementation MRFNetworking
static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (void)fetchArtistWithName:(NSString *)artistName completionBlock:(MRFArtistFetcherCompletionBlock)completionBlock {
    //set up url
    NSURLComponents *urlcomponents = [[NSURLComponents alloc] initWithString:baseURLString];
        //one query parameter = ?s=coldplay
    
    NSArray *queryItemArray = @[ [NSURLQueryItem queryItemWithName:@"s" value:artistName] ];
    urlcomponents.queryItems = queryItemArray;
        //construct final url with urlComponents
    NSURL *url = urlcomponents.URL;
    //check url
    NSLog(@"This is the url: %@", url); //test 1 worked. continue
    //create urlSessions
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //check if made request
        NSLog(@"made request");
        
    // handle errors
        if (error){
            NSLog(@"This is the error: %@", error);
            completionBlock(nil, error);
            return;
        }
        
    //create jsonError
        NSError *jsonError = nil;
        
        //create json dictionary
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        //check jsonError
        if (jsonError){
            NSLog(@"JSONError: %@",jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        
        //drill down into the artist array
        NSArray *artistArray = jsonDictionary[@"artists"];
        
        for (NSDictionary *dict in artistArray){
            //convert into model object
            MRFArtist *artist = [[MRFArtist alloc] initWithDictionary:dict]; //now we have an artist
            
            if (artist){
                completionBlock(artist, nil);
            }
        }
    }];
    [task resume];
    
    
    
    
    
    
    
    //no need for place holder array
    
    
}
@end
