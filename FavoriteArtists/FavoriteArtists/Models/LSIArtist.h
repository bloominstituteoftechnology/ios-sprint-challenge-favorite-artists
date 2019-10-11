//
//  LSIArtist.h
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;
@interface LSIArtist : NSObject <NSCoding>
@property NSString *artistName;
@property NSString *artistBio;
@property int formedYear;
-(instancetype)initWithDictionary: (NSDictionary*)dictionary;
-(instancetype)initWithArtistName:(NSString *)name
biography:(NSString *)bio
                    andFormedYear:(int)year;
@end


