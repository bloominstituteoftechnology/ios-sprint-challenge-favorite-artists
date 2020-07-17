//
//  DBEArtistController.m
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import "DBEArtistController.h"
#import "DBEArtist.h"
#import "DBEArtist+NSJSONSerialization.h"

@interface DBEArtistController()

@property (nonatomic) NSMutableArray *internalArtists;

@end

@implementation DBEArtistController

- (instancetype)init {
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addArtist:(DBEArtist *)artist {
    [self.internalArtists addObject: artist];
}

- (NSMutableArray *)fetchAllFavoriteArtists {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSArray *filePathsArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:documentsDirectory error:nil];
    
    for (NSString* artistPath in filePathsArray) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artistPath];
        NSString *artistFilePath = [NSHomeDirectory()stringByAppendingPathComponent:filePath];
        
        NSURL *artistURL = [NSURL fileURLWithPath:artistFilePath];
        
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        
        if (artistData) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:NULL];
            
            DBEArtist *artist = [[DBEArtist alloc] initWithDictionary:artistDictionary];
            [self.internalArtists addObject:artist];
        } else {
            NSLog(@"@artistData is nil");
        }
    }
    return self.internalArtists;
}

- (DBEArtist *)fetchSavedFavorites:(DBEArtist *)artist {
    NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                      inDomain:NSUserDomainMask
                                                             appropriateForURL:nil
                                                                        create:YES
                                                                         error:nil];
    
    NSURL *artistURL = [[documentDirectory URLByAppendingPathComponent:artist.name]
                        URLByAppendingPathComponent:@"json"];
    
    NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
    
    NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData
                                                                     options:0
                                                                       error:nil];
    
    DBEArtist *savedFavorites = [[DBEArtist alloc] initWithDictionary:artistDictionary];
    return savedFavorites;
}

@end
