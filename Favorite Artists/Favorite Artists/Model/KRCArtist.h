//
//  KRCArtist.h
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KRCArtist : NSObject

@property NSString *artistName;
@property NSInteger yearFormed;
@property NSString *bio;

- (instancetype)initWithName:(NSString *)name year:(NSInteger)year bio:(NSString *)bio;
- (instancetype)initWithFetchedJSON:(NSDictionary *)json;
- (instancetype)initWithFileJSON: (NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
