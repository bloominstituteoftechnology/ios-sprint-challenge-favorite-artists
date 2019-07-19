//
//  LSIArtist.h
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist : NSObject

@property NSString *strArtist;
@property NSString *strBiographyEN;
@property long intFormedYear;

- (instancetype)InitWithStrArtist:(NSString *)strArtist;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
