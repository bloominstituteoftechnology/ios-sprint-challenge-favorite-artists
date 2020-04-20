//
//  CDGArtist.h
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDGArtist: NSObject

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly) NSInteger formedYear;
@property (nonatomic, readonly, copy) NSString *biography;

- (instancetype)initWithArtist:(NSString *)artist
                    formedYear:(NSInteger)formedYear
                     biography:(NSString *)biography;

@end

NS_ASSUME_NONNULL_END
