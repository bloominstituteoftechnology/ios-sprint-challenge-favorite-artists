//
//  JWSongController.h
//  JWLyricFinder
//
//  Created by Jerrick Warren on 1/25/19.
//  Copyright © 2019 Jerrick Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JWSongController : NSObject

-(void)addSongWithTitle:(NSString *)title
             artistName:(NSString *)artistName
                 lyrics:(NSString *)lyrics
                 rating:(NSInteger *)rating;

// properties (like var Array)

@property (nonatomic, readonly) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
