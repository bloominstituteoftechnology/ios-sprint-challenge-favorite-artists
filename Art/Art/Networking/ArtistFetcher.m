//
//  ArtistFetcher.m
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import "ArtistFetcher.h"
#import "NPTLog.h"
#import "NPTArtist.h"


static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";
NSMutableArray<NPTArtist *>*artists;

@implementation ArtistFetcher

- (instancetype)init {
    self = [super init];
    if (self) {
        _favoriteArtists = artists;
    }
    return self ;
}

-(instancetype)initWithArtist:(NSMutableArray<NPTArtist *> *)artists {
    self = [super init];
    if (self) {
        _favoriteArtists = artists;
    }
    return self;
}

- (void)fetchArtistWithSearchTerm:(NSString *)term completionBlock:(NPTArtistFetcherCompletionBlock)completionBlock {
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString:baseURLString];
    
    urlComponents.queryItems = @[  [NSURLQueryItem queryItemWithName:@"s" value:term]   ];
    NSURL *url = urlComponents.URL;

    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"url: %@",url);
        
        
        if (error) { completionBlock(nil,error);
            return;
        }
        if (!data) {
            NSError *dataError = error;
            completionBlock(nil,dataError);
            return;
        }
        
        NSError *jsonError = nil;
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
    
        if (jsonError) {
            completionBlock(nil,jsonError);
            return;
        }
        NPTArtist *artistResult = [[NPTArtist alloc] initWithDictionary:json];
        
        NSMutableArray *ac = [NSMutableArray array];
        [ ac addObject:artistResult];

        completionBlock(artistResult,nil);
        
        
    }];
    
    [task resume];
    
   
}



@end
