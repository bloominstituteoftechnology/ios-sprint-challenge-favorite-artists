//
//  DYPSongController.h
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYPSongController : NSObject

- (void)addASongWithTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating;

@property (nonatomic, readonly) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
