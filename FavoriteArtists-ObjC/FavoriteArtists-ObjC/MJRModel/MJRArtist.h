//
//  MJRArtist.h
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJRArtist : NSObject

@property NSString *artistName;
@property int yearFormed;
@property NSString *bio;

- (instancetype)initWithArtistName:(NSString *)artistName bio:(NSString *)bio yearFormed:(int)yearFormed;

@end
