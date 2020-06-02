//
//  SBAArtist.h
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBAArtist : NSObject

- (instancetype)initWithArtistName:(NSString *)name
                         biography:(NSString *)biography
                        yearFormed:(int)yearFormed;

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int yearFormed;


@end

NS_ASSUME_NONNULL_END
