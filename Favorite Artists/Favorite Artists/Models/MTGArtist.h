//
//  MTGArtist.h
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTGArtist : NSObject

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) double formedYear;

- (instancetype)initWithArtist:(NSString *)artist
                     biography:(NSString *)biography
                    formedYear:(double)formedYear;
@end

NS_ASSUME_NONNULL_END
