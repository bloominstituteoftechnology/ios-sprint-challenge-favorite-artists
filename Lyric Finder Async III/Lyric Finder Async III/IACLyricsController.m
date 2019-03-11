//
//  IACLyricsController.m
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyricsController.h"
#import "IACSong+NSJSONSerialization.h"

NSString *baseURL = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
NSString *apiKey = @"cbd2b1a12fmsh0aaf0cc245b3792p14052ajsn976898523b4d";

@implementation IACLyricsController

- (instancetype)init {
    self = [super init];
    if (self) {
        _songs = [[NSMutableArray alloc] init];
        [self loadPersistentData];
    }
    return self;
}
- (void) createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating {
    IACSong *song = [[IACSong alloc] initWithSongTitle:title  artist:artist lyrics:lyrics rating:rating];
    [_songs addObject: song];
    [self savePersistentData];
}
- (void) updateSong:(IACSong *)song rating:(int)rating {
    [song setRating: rating];
    [self savePersistentData];
}
- (void) deleteSong:(IACSong *)song {
    [_songs removeObject: song];
    [self savePersistentData];
}

- (void)fetchLyricsForTitle:(NSString *)title artist:(NSString *)artist completionBlock:(CompletionHandler)completionBlock {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString: baseURL];
    NSMutableArray *queryItems = [@[[NSURLQueryItem queryItemWithName:@"q_artist" value: artist],
                                    [NSURLQueryItem queryItemWithName:@"q_track" value: title]
                                    ] mutableCopy];
    [urlComponents setQueryItems:queryItems];
    NSURL *url = urlComponents.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:apiKey forHTTPHeaderField:@"X-RapidAPI-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // Check for error fetching lyrics
        if (error) {
            NSLog(@"Error fetching lyrics: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        // Check if data is empty
        if (!data) {
            NSLog(@"No data return");
            completionBlock(nil, nil);
            return;
        }
        
        // Check for error decoding JSON
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!result) {
            NSLog(@"Error decoding json: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        IACSong *song = [[IACSong alloc] init];
          song.lyrics = result[@"lyrics_body"];
        completionBlock(song, nil);
        return;
        
    }] resume];
}

/*
 Persist your model object using NSFileManager to save your model objects to a file on the
 application's document directory. Note: As you do not have access to Codable use NSJSONSerialization
 to help turn your model objects into NSData
 */

- (void)savePersistentData {
    NSMutableArray *arrayOfSongs = [[NSMutableArray alloc] init];
    for (IACSong *song in self.songs) {
        [arrayOfSongs addObject:[song songDictionary]];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject: arrayOfSongs options: 0 error: NULL];
    
    // Set file manager to default file manager
    NSURL *documentURL = [NSFileManager.defaultManager
                           // Find the directory for NSDocumentDirectory
                           URLsForDirectory:NSDocumentDirectory
                           // Where to save the user’s personal items
                           inDomains:NSUserDomainMask][0];
    // Save the path as a url
    NSURL *url = [documentURL URLByAppendingPathComponent:@"songs"];
    [data writeToURL: url options: 0 error: NULL];
}

- (void)loadPersistentData {
    NSURL *documentURL = [[NSFileManager.defaultManager
                            URLsForDirectory:NSDocumentDirectory
                            inDomains:NSUserDomainMask] firstObject];
    
    NSURL *url = [documentURL URLByAppendingPathComponent:@"songs"];
    NSData *data = [NSData dataWithContentsOfURL: url];
    if (data) {
        NSArray *arrayOfSongs = [NSJSONSerialization JSONObjectWithData: data options: 0 error: NULL];
        for (NSDictionary *dictionary in arrayOfSongs) {
            IACSong *song = [[IACSong alloc] initWithDictionary: dictionary];
            [self.songs addObject: song];
        }
    }
}
@end
