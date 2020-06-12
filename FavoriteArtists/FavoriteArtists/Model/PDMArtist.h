//
//  PDMArtist.h
//  FavoriteArtists
//
//  Created by Patrick Millet on 6/12/20.
//  Copyright © 2020 PatrickMillet79. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern int const PDM_Artist_UnknownYear;

@interface PDMArtist : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *biography;
@property (nonatomic, readonly) NSInteger yearFormed;

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(NSInteger)yearFormed;


@end

NS_ASSUME_NONNULL_END
