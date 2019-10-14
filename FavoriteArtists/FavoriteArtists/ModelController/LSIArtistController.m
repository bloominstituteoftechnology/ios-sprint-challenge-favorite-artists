//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"
#import "LSIArtist+NSJSONSerialization.h"

@interface LSIArtistController()
@end

@implementation LSIArtistController

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?=";

-(instancetype)init {
    self = [super init];
    if (self) {
       // _artists = [[NSMutableArray alloc] init];
        _artists = [@[] mutableCopy];
    }
    return self;
}



-(void)fetchArtistWithName:(NSString *)artistName completionBlock:(LSIArtistControllerCompletionBlock)completionBlock {
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
         LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:jsonDictionary[0]];
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
  //  [self saveToPersistentStore];
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


-(NSMutableArray *)artistArray {
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
            LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDictionary];
            [self.artists addObject:artist];
        } else {
            NSLog(@"Artist Data returned nil");
        }
        
    }
    return self.artists;
}





//-(NSURL *)getPerisitentFileURL {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSURL *documents = [fileManager URLForDirectory: NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL: nil create: YES error: nil];
//   return [documents URLByAppendingPathComponent:@"FavoriteArtists.plist"];
//}


//-(void)loadFromPersistentStore {
//NSURL *url =  [self getPerisitentFileURL];
//    NSLog(@"%@", url);
//NSData *data = [[NSData alloc] initWithContentsOfURL: url];
//    NSError *error = nil;
////
////    NSArray *plistArray = (NSArray *)[NSPropertyListSerialization propertyListWithData:data
////    options:NSPropertyListImmutable
////     format:nil
////      error:&error];
//
//    NSDictionary *artistDictionary = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format: nil error:&error];
//    LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDictionary];
//
//
//}




@end
