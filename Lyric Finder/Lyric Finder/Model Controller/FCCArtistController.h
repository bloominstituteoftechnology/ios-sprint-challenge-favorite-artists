//
//  FCCArtistController.h
//  Lyric Finder
//
//  Created by Lambda_School_Loaner_34 on 4/5/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCCArtistController : NSObject

- (void)createFavoriteWithArtist:(NSString *)artist year:(NSInteger)year biography:(NSString *)biography;

- (void)fetchWithArtist:(NSString *)artist completion:(void (^)(NSError *))completion;

@property(nonatomic, readonly) NSArray *artists;

@end

NS_ASSUME_NONNULL_END
