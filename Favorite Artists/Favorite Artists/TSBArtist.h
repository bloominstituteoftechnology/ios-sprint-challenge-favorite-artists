//
//  TSBArtist.h
//  Favorite Artists
//
//  Created by Thomas Sabino-Benowitz on 7/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSBArtist : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *biography;
@property (nonatomic) int yearFormed;


- (NSDictionary *)dictionaryRep;

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
