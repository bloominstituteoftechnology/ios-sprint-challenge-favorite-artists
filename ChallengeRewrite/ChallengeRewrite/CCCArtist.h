//
//  CCCArtist.h
//  ChallengeRewrite
//
//  Created by Ryan Murphy on 7/19/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCCArtist : NSObject

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography andYearFormed:(int)yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *biography;
@property (nonatomic) int yearFormed;

- (NSDictionary *)dictionaryRep;

@end

NS_ASSUME_NONNULL_END
