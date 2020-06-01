//
//  DSCArtistController.h
//  FavoriteArtists
//
//  Created by denis cedeno on 5/31/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DSCArtist;

NS_ASSUME_NONNULL_BEGIN

@interface DSCArtistController : NSObject

@property (nonatomic) NSMutableArray *artistArray;

@property DSCArtist *artist;

- (NSArray *)returnArtistArray;
- (NSURL *)persistentFileURL;
- (void)saveArtist:(DSCArtist *)artist;
- (void)saveArtistDictionary:(NSDictionary *)artistDictionary;
- (void)saveToPersistentStore;
- (void)loadFromPersistentStore;

@end

NS_ASSUME_NONNULL_END
