//
//  TLCArtistController.h
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/21/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TLCArtist;
@interface TLCArtistController : NSObject

@property (nonatomic, readonly) NSArray *artists;

-(void)searchForArtists:(NSString *) name completion:(void (^)(TLCArtist *artist, NSError *error)) completion;

-(void)saveDictionary:(NSDictionary *)dictionary;

@end


