//
//  DSCArtist.h
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DSCArtist : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *biography;
@property (nonatomic) int year;

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                        year:(int)year;

@end

NS_ASSUME_NONNULL_END
