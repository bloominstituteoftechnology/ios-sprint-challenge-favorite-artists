//
//  EPWArtist.h
//  Favorite-Artists Sprint
//
//  Created by Elizabeth Wingate on 4/17/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EPWArtist : NSObject

@property (nonatomic) NSString *name; //"strArtist"
@property (nonatomic) NSUInteger formedYear; //"intFormedYear"
@property (nonatomic) NSString *biography; // "strBiographyEN"

- (instancetype)initWithName:(NSString *)name
                  formedYear:(NSUInteger)formedYear
                    biography:(NSString *)biography;

@end

NS_ASSUME_NONNULL_END
