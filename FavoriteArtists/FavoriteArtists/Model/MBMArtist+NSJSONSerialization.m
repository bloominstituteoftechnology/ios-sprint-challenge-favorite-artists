//
//  MBMArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtist+NSJSONSerialization.h"
#import "ArtistFetcher.h"

@implementation MBMArtist (NSJSONSerialization)


//- (instancetype)initWithContentsOfURL:(NSMutableDictionary *)persistedArtists {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSURL *documentsDirectoryPath = [paths objectAtIndex:0];
//    NSURL *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"artists.plist"];
//
//    NSLog(@"Path: %@", filePath);
//    [persistedArtists writeToURL:filePath atomically:YES];
//
//    self = [self initWithArtistName:artistName
//                         yearFormed:yearFormed.intValue
//                    artistBiography:artistBiography];
//
//    return self;
//}

//NSError error = nil;
//
//NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonArray
//                                                   options:NSJSONWritingPrettyPrinted
//                                                     error:&error];



- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artistName = dictionary[@"strArtist"];
    
    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    
    NSString *artistBiography = dictionary[@"strBiographyEN"];
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
//    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"artists.plist"];
////
//    NSLog(@"Path: %@", filePath);
//    [dictionary writeToURL:filePath atomically:YES];
//

    
    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
    }
    
    if (!(artistName || artistBiography)) {
        return nil;
    }
    
    self = [self initWithArtistName:artistName
                         yearFormed:yearFormed.intValue
                    artistBiography:artistBiography];
    
    return self;
}

@end
