//
//  LSILyric.h
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSILyric : NSObject

-(instancetype) initWithTitle: (NSString *)title arstistName: (NSString *)artistName lyrics: (NSString *)lyrics rating: (NSInteger)rating;

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *artistName;
@property (nonatomic) NSString *lyrics;
@property (nonatomic) NSInteger rating;

@end

NS_ASSUME_NONNULL_END
