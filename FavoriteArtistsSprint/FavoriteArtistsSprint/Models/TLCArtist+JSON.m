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
    
    NSString *name = dictionary[@"strArtist"];
    NSString *strFormedYear = dictionary[@"intFormedYear"];
    int formedYear = 0;
    if ([strFormedYear isKindOfClass: [NSString class]]) {
        formedYear = [strFormedYear intValue];
    
        
    }
    NSString *biography = dictionary[@"strBiographyEN"];
    return [self initWithName:name artistBio:biography yearFormed: formedYear];
    
    
}
-(NSDictionary *)toDictionary {
    NSDictionary *artistDictionary = @{
        @"strArtist": self.name,
        @"intFormedYear": [self yearFormedString],
        @"strNiographyEN" : self.artistBio
        
    };
    return artistDictionary;
}

@end
