//
//  JTMLongLyricsController.h
//  Lyric Finder
//
//  Created by Jonathan T. Miles on 10/5/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTMSongLyrics.h"

NS_ASSUME_NONNULL_BEGIN

@interface JTMLongLyricsController : NSObject

-(void)searchForLyricsWithSongTitle:(NSString *)title byArtist:(NSString *)artist completionHandler: (void (^)(JTMSongLyrics *lyrics, NSError *))completion;

-(void)saveNewLyricFromDictionary:(NSDictionary *)dictionary;

-(void)saveToPersistentStore;

-(void)loadFromPersistentStore;

@property (nonatomic) NSArray *lyricsDictionaries;

@end

NS_ASSUME_NONNULL_END
