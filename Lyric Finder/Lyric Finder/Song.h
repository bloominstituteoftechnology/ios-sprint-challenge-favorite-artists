//
//  Song.h
//  Lyric Finder
//
//  Created by Moin Uddin on 11/16/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Song : NSObject

-(instancetype) initWithTitle: (NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger *)rating;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property NSInteger *rating;

@end

NS_ASSUME_NONNULL_END
