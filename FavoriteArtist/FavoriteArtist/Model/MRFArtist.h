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

@property (nonatomic, readonly, copy)NSString *artist;
@property (nonatomic, readonly, copy) NSString *yearFormed;
@property (nonatomic, readonly, copy) NSString *bio;

- (instancetype)initWithArtistName:(NSString *)name
                        yearFormed:(NSString *)yearFormed
                               bio:(NSString *)bio;
@end

NS_ASSUME_NONNULL_END
