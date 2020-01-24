//
//  JPHArtist.h
//  FavoriteArtistSprint
//
//  Created by Jerry haaser on 1/24/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JPHArtist : NSObject

@property NSString *artistName;
@property int yearFormed;
@property NSString *bio;

- (instancetype)initWithArtistName: (NSString *)artistName bio:(NSString *)bio yearFormed:(int)yearFormed;

@end

NS_ASSUME_NONNULL_END
