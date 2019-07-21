//
//  TXCArtistController.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtistController.h"
#import "TXCArtist.h"
#import "TXCArtist+TXCArtist_NSJSONSerialization.h"



@implementation TXCArtistController

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php?s=";



- (void)fetchArtistWithName:(NSString *)name completionBlock:(TXCArtistFetcherCompletionBlock)completionBlock {
    
//    NSURL *baseURL = [[NSURL alloc] initFileURLWithPath:baseURLString];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];

    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];

    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;
//    NSURL *url = [baseURL URLByAppendingPathComponent:name];
    NSLog(@"URL: %@", url);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Data: %@", data);
        
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(nil, error);
            return;
        }
        if (data) {
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError) {
                completionBlock(nil, jsonError);
                return;
            }
            NSArray *results = json[@"artists"];
            NSLog(@"Results: count: %lu", results.count);
            
            self.artists = [[NSMutableArray alloc] init];
            for (NSDictionary *artistDictionary in results) {
              TXCArtist *artist = [[TXCArtist alloc] initWithDictionary:artistDictionary];
                
                if (artist) {
                    [self.artists addObject:artist];
                }
            }
            
            completionBlock(self.artists, nil);
            
        } else {
            
        }
       
        
    }];
    [task resume];

}

//- (void)saveToPersistentStore {
//    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *filepath = [documentsDirectory stringByAppendingPathComponent:@"artists.plist"];
//    
//    
//}




@end
