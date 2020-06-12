//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"
#import "LSIErrors.h"

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php";
@implementation LSIArtistController


- (void)fetchArtistName:(NSString *)name completionHandler:(CompletionHandler)completionHandler {
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURL];
     urlComponents.queryItems = @[
         [NSURLQueryItem queryItemWithName:@"s" value:name]
     ];
    
    NSURL *url = urlComponents.URL;
    
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completionHandler(nil, error);
            return;
        }
        
         if (!data) {
                  NSError *dataError = errorWithMessage(@"No artist data returned", LSIDataNilError);
                  completionHandler(nil, dataError);
                  return;
              }
        
        NSError *jsonError = nil;
    
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completionHandler(nil, jsonError);
            return;
        }
        
        LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:dictionary];
        
        completionHandler(artist, nil);
        
    }];
    [task resume];
}


- (NSArray *)fetchSavedArtist {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [path objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (NSString *artist in filePaths) {
        NSString *artistDirPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", artist];
        NSURL *artistURL = [NSURL fileURLWithPath:artistDirPath];
        
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        NSDictionary *artistDictionary = [NSJSONSerialization
                                          JSONObjectWithData:artistData
                                          options:0
                                          error:nil];
        
    LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }
    
    return artists;
}
@end
