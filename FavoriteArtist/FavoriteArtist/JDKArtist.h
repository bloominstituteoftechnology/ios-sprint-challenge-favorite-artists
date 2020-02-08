//
//  JDKArtist.h
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDKArtist : NSObject

@property NSString *name;
@property NSString *biography;
@property int yearFormed;

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed;

@end

NS_ASSUME_NONNULL_END
