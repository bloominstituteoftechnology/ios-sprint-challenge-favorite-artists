//
//  JWSong.h
//  JWLyricFinder
//
//  Created by Jerrick Warren on 1/25/19.
//  Copyright © 2019 Jerrick Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JWSong : NSObject

-(instancetype)initWithTitle:(NSString *)title
                  artistName:(NSString *)artistName
                      lyrics:(NSString *)lyrics
                      rating:(NSInteger *)rating;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *lyrics;
@property (nonatomic) NSInteger *rating; // cant use copy?

@end

NS_ASSUME_NONNULL_END
