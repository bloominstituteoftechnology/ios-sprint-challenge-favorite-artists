//
//  KSIArtist.h
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSIArtist : NSObject

- (instancetype)initWithName:(NSString *)name
             artistBiography:(NSString *)biography
            yearArtistFormed:(double)yearArtistFormed NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic,readonly,copy) NSString *name;
@property (nonatomic,readonly,copy) NSString *biography;
@property (nonatomic,readonly) double yearArtistFormed;

@end

NS_ASSUME_NONNULL_END
