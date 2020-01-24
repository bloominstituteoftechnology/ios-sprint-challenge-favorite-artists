//
//  JBArtistController.h
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import <Foundation/Foundation.h>


@class JBArtist;


@interface JBArtistController : NSObject

@property (nonatomic, readonly) NSArray *artists;
- (instancetype)init;
- (void)addArtist:(JBArtist *)artist;
- (void)fetchArtistWithName:(NSString *)name
                       completion:(void (^)(JBArtist *artist,
                                            NSError *error)
                                   )completion;
- (void)removeArtist:(JBArtist *)artist;
- (void)moveArtistFromOldIndex:(NSUInteger)oldIndex
                    toNewIndex:(NSUInteger)newIndex;

@end

