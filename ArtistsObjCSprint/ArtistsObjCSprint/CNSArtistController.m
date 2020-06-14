//
//  CNSArtistController.m
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/13/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSArtistController.h"
#import "CNSArtistModel.h"
#import "CNSArtistModel+ArtistSerialization.h"

@interface CNSArtistController()
@end

@implementation CNSArtistController
static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?=";

-(instancetype)init {
    self = [super init];
    if (self) {
       // _artists = [[NSMutableArray alloc] init];
        _artists = [@[] mutableCopy];
    }
    return self;
}

-(void)fetchArtistWithName:(NSString *)artistName completionBlock:(CNSArtistControllerCompletionBlock)completionBlock {
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
       NSArray *queryItems = @[ [NSURLQueryItem queryItemWithName:@"s" value:artistName] ];
       urlComponents.queryItems = queryItems;
       NSURL *url = urlComponents.URL;
    
     NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         if (error) {
             NSLog(@"Error fetching artist: %@", error);
             completionBlock(nil, error);
             return;
         }
          NSError *jsonError = nil;
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
         if (jsonError) {
             NSLog(@"JSON Error: %@", jsonError);
             completionBlock(nil, jsonError);
             return;
         }
         NSArray *jsonDictionary = json[@"artists"];
         
         if (jsonDictionary != (id) [NSNull null]){
         CNSArtistModel *artist = [[CNSArtistModel alloc] initWithDictionary:jsonDictionary[0]];
         [self.artists  addObject:artist];
         completionBlock(artist, nil);
         }
         NSLog(@"error: %@", error);
         completionBlock(nil, error);
     }];
    [task resume];
}


-(void)addArtistWithName:(NSString *)name
artistBio:(NSString *)bio
              formedYear:(int)year {
    CNSArtistModel *artist = [[CNSArtistModel alloc] initWithArtistName:name
                                                    biography:bio andFormedYear:year];
    [self.artists addObject:artist];
  //  [self saveToPersistentStore];
}

-(void)update:(CNSArtistModel *)artist
withArtistName:(NSString *)name
biography:(NSString *)bio
   formedYear:(int)year {
    artist.artistName = name;
    artist.artistBio = bio;
    artist.formedYear = year;
}

-(LSIArtist *)objectInArtistAtIndex:(NSUInteger)index
{
    return [self.artists objectAtIndex: index];
}


-(NSMutableArray *)artistArray
{
    NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [searchPath objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    
    for (NSString *artist in filePaths) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artist];
        NSString *artistPath = [NSHomeDirectory()stringByAppendingPathComponent:filePath];
        
        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        
        if (artistData != nil) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            CNSArtistModel *artist = [[CNSArtistModel alloc] initWithDictionary:artistDictionary];
            [self.artists addObject:artist];
        } else {
            NSLog(@"Artist Data nil");
        }
        
    }
    return self.artists;
}
@end
