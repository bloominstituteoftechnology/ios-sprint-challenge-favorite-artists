//
//  OTKArtist.h
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OTKArtist : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *bio;
@property (nonatomic, readonly) int yearFormed;

- (instancetype)initWithName:(NSString *)name
                         bio:(NSString *)bio
                  yearFormed:(int)yearFormed;

@end

NS_ASSUME_NONNULL_END
