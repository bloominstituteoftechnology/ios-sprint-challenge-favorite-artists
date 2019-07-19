//
//  SLRArtist.h
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLRArtist : NSObject

// theaudiodb.com/api/v1/json/1/search.php?s=coldplay
// name = strArtist
// biography = strBiographyEN
// yearFormed = intFormedYear
// ----
// image = strArtistThumb
// logo = strArtistLogo

// Properties
@property NSString *artistName;
@property NSString *biography;
@property int year;

- (instancetype)initWithArtistName: (NSString *)artistName biography: (NSString *)biography year: (int)year;

@end

NS_ASSUME_NONNULL_END
