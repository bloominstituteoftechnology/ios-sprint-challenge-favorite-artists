//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistController()
@end

@implementation LSIArtistController

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/";

-(instancetype)init {
    self = [super init];
    if (self) {
        _artists = [@[] mutableCopy];
    }
    return self;
}

-(void)fetchArtistWithName:(NSString *)artistName completionBlock:(LSIArtistControllerCompletionBlock)completionBlock {
    NSString *search = @"search.php?s=";
    NSString *completeURL = [NSString stringWithFormat:@"%@%@%@", baseURLString, search, artistName];
//    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
//    urlComponents.query = [@"search.php?s=" stringByAppendingFormat:@"%@", artistName];
    NSURL *url = [[NSURL alloc] initWithString:completeURL];
    NSLog(@"URL: %@", url);
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
         LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:json];
         [self.artists  addObject:artist];
         completionBlock(artist, nil);
     }];
    [task resume];
}


-(void)addArtistWithName:(NSString *)name
artistBio:(NSString *)bio
              formedYear:(int)year {
    LSIArtist *artist = [[LSIArtist alloc] initWithArtistName:name
                                                    biography:bio andFormedYear:year];
    [self.artists addObject:artist];
}

-(void)update:(LSIArtist *)artist
withArtistName:(NSString *)name
biography:(NSString *)bio
   formedYear:(int)year {
    artist.artistName = name;
    artist.artistBio = bio;
    artist.formedYear = year;
}

-(LSIArtist *)objectInArtistAtIndex:(NSUInteger)index {
    return [self.artists objectAtIndex: index];
}

-(NSURL *)getPerisitentFileURL {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documents = [fileManager URLForDirectory: NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL: nil create: NO error: nil];
   return [documents URLByAppendingPathComponent:@"FavoriteArtists.plist"];
}



@end
