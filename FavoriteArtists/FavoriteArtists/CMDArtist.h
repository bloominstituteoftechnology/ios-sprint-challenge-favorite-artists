//
//  CMDArtist.h
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMDArtist : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic) int year;
@property (nonatomic, copy)NSString *biography;

- (instancetype)initWithName:(NSString *)name
                        year:(int)year
                   biography:(NSString *)biography;

@end

NS_ASSUME_NONNULL_END
