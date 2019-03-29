//
//  NELLyric.h
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NELLyric : NSObject

- (instancetype)intiWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *artist;
@property (nonatomic) NSString *lyrics;
@property (nonatomic) int rating;



@end

NS_ASSUME_NONNULL_END
