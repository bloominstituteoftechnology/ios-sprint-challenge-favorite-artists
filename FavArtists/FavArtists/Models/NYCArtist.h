//
//  NYCArtist.h
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NYCArtist : NSObject<NSCoding>

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *biography;
@property (nonatomic) int yearFormed;

@end

NS_ASSUME_NONNULL_END
