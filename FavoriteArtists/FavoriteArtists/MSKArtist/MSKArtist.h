//
//  MSKArtist.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/16/20.
//  Copyright © 2020 Lambda. All rights reserved.
//
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface MSKArtist: NSObject
@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *artistBiography;
@property (nonatomic, readonly) int yearFormed;
- (instancetype)initWithName:(NSString *)artistName
             artistBiography:(NSString *)artistBiography
                  yearFormed:(int)yearFormed;
@end
NS_ASSUME_NONNULL_END
