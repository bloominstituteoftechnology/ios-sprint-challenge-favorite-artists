//
//  TLCArtist+JSON.m
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/21/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCArtist+JSON.h"


@implementation TLCArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
//    if (![t isEqual:nil]) {
//        NSLog(@"Not nil");
//    }
    /* if (tel == (id)[NSNull null]) {
        // tel is null
    }*/
    
    NSString *name = dictionary[@"strArtist"];
    if (name == (id)[NSNull null]) {
        name = @"Null Protection String";
    }
    NSString *strFormedYear = dictionary[@"intFormedYear"];
    int formedYear = 0;
    if ([strFormedYear isKindOfClass: [NSString class]]) {
        formedYear = [strFormedYear intValue]; //already null safe if not string formyear = 0
    
        
    }
    NSString *biography = dictionary[@"strBiographyEN"];
    if (biography == (id)[NSNull null]) {
        biography = @"Null Protection String";
    }
    return [self initWithName:name artistBio:biography yearFormed: formedYear];
    
    
}
-(NSDictionary *)toDictionary {
    NSDictionary *artistDictionary = @{
        @"strArtist": self.name,
        @"intFormedYear": [self yearFormedString],
        @"strBiographyEN" : self.artistBio
        
    };
    return artistDictionary;
}

@end
