//
//  JDFArtist.h
//  Favorite Artists
//
//  Created by Jonathan Ferrer on 7/19/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDFArtist : NSObject


@property (nonatomic) NSString *name;
@property (nonatomic) NSString *biography;
@property (nonatomic) int yearFormed;

- (NSDictionary *)dictionaryRep;

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
