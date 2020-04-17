//
//  KMLArtist.h
//  FavoriteArtists
//
//  Created by Keri Levesque on 4/17/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMLArtist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *biography;
@property (nonatomic) int formedYear;

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                  formedYear:(int)formedYear;


- (NSString *)formedYearString;

@end

NS_ASSUME_NONNULL_END
