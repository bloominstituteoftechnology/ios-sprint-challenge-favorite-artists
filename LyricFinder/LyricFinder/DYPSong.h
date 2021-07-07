//
//  DYPSong.h
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYPSong : NSObject

- (instancetype)initWithTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *lyrics;
@property (nonatomic) NSInteger rating;

@end

NS_ASSUME_NONNULL_END
