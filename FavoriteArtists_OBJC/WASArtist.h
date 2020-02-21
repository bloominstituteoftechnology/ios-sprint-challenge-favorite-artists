//
//  WASArtist.h
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 2/21/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WASArtist : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *biography;
@property (nonatomic) int yearFormed;

- (NSDictionary *)dictionaryRep;

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
