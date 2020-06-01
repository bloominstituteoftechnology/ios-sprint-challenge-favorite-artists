//
//  DSCFetchArtist.m
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCFetchArtist.h"
#import "DSCArtist.h"
#import "DSCArtist+_NSJSONSerialization.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation DSCFetchArtist

- (void)fetchArtist:(NSString *)name completion:(ArtistFetcherCompletionHandler)completionHandler
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:name]
    ];
    NSURL *url = urlComponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching artists: %@", error);
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
            return;
        }
        if (dictionary[@"artists"] != [NSNull null])
        {
            NSArray *artistDictionary = dictionary[@"artists"];
            NSDictionary *artistObject = artistDictionary.firstObject;
            DSCArtist *artist = [[DSCArtist alloc]initWithDictionary:artistObject];
            completionHandler(artist, nil);
        }
        
        
    }] resume];
}

//- (NSArray *)fetchedSavedArtist
//{
//    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *directory = [path objectAtIndex:0];
//    NSArray *filePath = [[NSFileManager defaultManager]subpathsAtPath:directory];
//    
//    NSMutableArray *artistsArray = [[NSMutableArray alloc]init];
//    
//    for (NSString *name in filePath)
//    {
//        NSString *artistStringPath = [NSHomeDirectory() stringByAppendingFormat:@"/documents%@", name];
//        NSURL *artistURL = [NSURL fileURLWithPath:artistStringPath];
//        NSLog(@"artist URL:%@", artistURL);
//        NSData *artistData = [[NSData alloc]initWithContentsOfURL:artistURL];
//        NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
//        
//        DSCArtist *artist = [[DSCArtist alloc]initWithDictionary:artistDictionary];
//        [artistsArray addObject:artist];
//    }
//    
//    return artistsArray;
//}

@end

