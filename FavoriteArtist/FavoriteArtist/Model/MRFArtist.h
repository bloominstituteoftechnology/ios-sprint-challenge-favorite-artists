//
//  MRFArtist.h
//  PXFavArtist
//
//  Created by Michael Flowers on 7/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MRFArtist : NSObject

@property NSString *artist;
@property int yearFormed;
@property NSString *bio;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithArtistName:(NSString *)name
                        yearFormed:(int)yearFormed
                               bio:(NSString *)bio;
@end

NS_ASSUME_NONNULL_END
