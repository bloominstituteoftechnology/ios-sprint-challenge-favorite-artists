//
//  Song.h
//  LyricFinder
//
//  Created by Carolyn Lea on 10/5/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Song : NSObject

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property NSInteger rating;

-(instancetype)initWithArtist:(NSString *)artist title:(NSString *)title lyrics:(NSString *)lyrics rating:(NSInteger)rating;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

