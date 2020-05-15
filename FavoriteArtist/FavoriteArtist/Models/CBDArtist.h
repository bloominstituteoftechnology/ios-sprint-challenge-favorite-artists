//
//  CBDArtist.h
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBDArtist : NSObject

@property NSString *name;
@property int yearFormed;
@property NSString *details;

- (instancetype)initWithName:(NSString *)name
                  yearFormed:(int)yearFormed
                     details:(NSString *)details;

@end

NS_ASSUME_NONNULL_END
