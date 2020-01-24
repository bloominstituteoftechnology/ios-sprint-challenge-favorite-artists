//
//  DPRArtist.h
//  Favorite Artists
//
//  Created by Dennis Rudolph on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DPRArtist : NSObject

@property NSString *name;
@property NSInteger yearFormed;
@property NSString *bio;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithName:(NSString *)name
                  yearFormed:(NSInteger)yearFormed
                         bio:(NSString *)bio;
@end

NS_ASSUME_NONNULL_END
