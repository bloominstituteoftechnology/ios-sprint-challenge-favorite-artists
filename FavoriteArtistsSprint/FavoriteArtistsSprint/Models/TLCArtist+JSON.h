//
//  TLCArtist+JSON.h
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/21/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCArtist.h"



@interface TLCArtist (NSJSONSerialization)
-(instancetype) initWithDictionary: (NSDictionary *)dictionary;
-(NSDictionary *)toDictionary;

@end 
