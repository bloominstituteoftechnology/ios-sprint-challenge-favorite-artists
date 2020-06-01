//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/31/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "ArtistController.h"

@implementation ArtistController

//: URL? {
//    let fileManager = FileManager.default
//    guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
//    return documents.appendingPathComponent("ReadingList.plist")
//}

- (void)saveArtistToFavorites:(Artist *)artist
{
    [self.artists addObject:artist];
}

- (void)saveTopersistentStore
{

}

- (void)loadFromPersistentStore
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];

    if ([fileManager fileExistsAtPath:self.artistListURL.path]) {
        NSDictionary *artistDictionary = [NSDictionary initWithContentsOfURL:self.artistListURL];

    }
}

@end
