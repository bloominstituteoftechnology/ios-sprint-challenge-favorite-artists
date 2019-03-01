//
//  ABCSongController.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCSongController.h"
#import "Song+NSJSONSerialization.h"

@implementation ABCSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _savedSongsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)saveSongwithTrack:(NSString *)track withArtist:(NSString *)artist withLyrics:(NSString *)lyrics withRating:(NSInteger)rating {
    Song *song = [[Song alloc] init];
    NSFileManager *fileManager = NSFileManager.defaultManager;
    [fileManager createDirectoryAtURL:NSBundle.mainBundle.bundleURL withIntermediateDirectories: NO attributes: nil error: nil];
    song.lyrics = lyrics;
    song.title = track;
    song.artist = artist;
    song.rating = rating;
    NSDictionary *newDictionary = [[NSDictionary alloc] init];
    newDictionary = [song songAsDictionary:song];
    NSData *data = [[NSData alloc] init];
    [NSJSONSerialization dataWithJSONObject: newDictionary options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
     NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = song.artist;
    fileName = [fileName stringByAppendingString:song.title];
    fileName = [fileName stringByAppendingString:@".json"];
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    [[json dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
    [_savedSongsArray addObject:song];
}

@end
