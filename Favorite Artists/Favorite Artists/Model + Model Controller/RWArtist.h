//
//  RWArtist.h
//  Favorite Artists
//
//  Created by Rick Wolter on 2/21/20.
//  Copyright © 2020 Devshop7. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RWArtist : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *bio;
@property(nonatomic, readonly) NSInteger yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

- (instancetype)initWithName:(NSString *)name
yearFormed:(NSInteger)yearFormed
       bio:(NSString *)bio;



@end

NS_ASSUME_NONNULL_END
