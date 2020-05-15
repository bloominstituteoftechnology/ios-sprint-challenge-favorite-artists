//
//  LYDArtist.h
//  LYDFavoriateArtist
//
//  Created by Lydia Zhang on 5/15/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYDArtist : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic) int year;
@property (nonatomic, copy)NSString *biography;

- (instancetype)initWithName:(NSString *)name
                        year:(int)year
                   biography:(NSString *)biography;

@end

NS_ASSUME_NONNULL_END
