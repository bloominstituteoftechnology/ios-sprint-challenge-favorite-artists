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
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *biography;
@property (nonatomic, readonly) NSInteger yearFormed;

- (instancetype)initWithName:(NSString *)name
                  yearFormed:(NSInteger)yearFormed
                   biography:(NSString *)biography;

@end

NS_ASSUME_NONNULL_END
