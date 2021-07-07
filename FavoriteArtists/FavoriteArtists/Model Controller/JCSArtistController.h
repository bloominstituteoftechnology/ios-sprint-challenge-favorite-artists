//
//  JCSArtistController.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCSArtist.h"

//@class JCSArtist;

NS_ASSUME_NONNULL_BEGIN

@interface JCSArtistController : NSObject

- (instancetype)init;

- (void)addNewArtist:(JCSArtist *)artist;

//-(void)saveToPersistentStore;
-(void)loadFromPersistentStore;

//- (void)fetchArtistByName:(NSString *)name completion:(void (^)(NSError *))completion;
- (void)fetchArtistByName:(NSString *)name completion:(void (^)(NSError *))completion;

@property (nonatomic, readonly) NSArray *savedArtists;
@property (nonatomic, readonly) NSArray *foundArtists;

@end

NS_ASSUME_NONNULL_END
