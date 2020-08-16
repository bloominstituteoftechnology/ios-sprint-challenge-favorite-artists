//
//  LSIArtist.h
//  Favorite_Artistis
//
//  Created by Joe on 5/30/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist : NSObject

// MARK: - Properties
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *artistInfo;
@property (nonatomic, copy) NSString *yearFormed;

// MARK: - Methods

- (instancetype)initWithName:(NSString *)artistName
                  artistInfo:(NSString *)artistInfo
                    yearFormed:(NSString *)yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
