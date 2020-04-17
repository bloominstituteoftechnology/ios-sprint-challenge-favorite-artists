//
//  SAHArtist.h
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAHArtist : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) int yearFormed;
@property (nonatomic, readonly) NSString *biography;

- (instancetype)initWithName:(NSString *)name yearFormed:(int)yearFormed biography:(NSString *)biography;

@end

NS_ASSUME_NONNULL_END
