//
//  JCSArtist.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCSArtist : NSObject

-(instancetype)initWithName:(NSString *)artistName dictionary:(NSDictionary *)dictionary;

- (instancetype)initWithName:(NSString *)artistName bio:(NSString *)biography yearFormed:(int)yearFormed;

@property (nonatomic) NSString *artistName;
@property (nonatomic) NSString *biography;
@property (nonatomic) int yearFormed;

@end

NS_ASSUME_NONNULL_END
