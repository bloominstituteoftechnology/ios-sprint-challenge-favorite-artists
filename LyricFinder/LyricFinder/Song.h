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

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *artist;
@property (nonatomic, copy, readonly) NSString *lyrics;
@property (nonatomic) NSInteger rating;

-(instancetype)initWithArtist:(NSString *)artist title:(NSString *)title lyrics:(NSString *)lyrics rating:(NSInteger)rating;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END

