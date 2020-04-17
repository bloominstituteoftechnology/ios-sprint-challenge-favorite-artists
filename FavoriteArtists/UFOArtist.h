//
//  UFOArtist.h
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UFOArtist : NSObject

// MARK: - Properties
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) int yearFormed;
@property (nonatomic, readonly, copy)NSString *artistBiography;

- (instancetype)initWithName:(NSString *)name
                  yearFormed:(int)yearFormed
                   artistBiography:(NSString *)artistBiography;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
