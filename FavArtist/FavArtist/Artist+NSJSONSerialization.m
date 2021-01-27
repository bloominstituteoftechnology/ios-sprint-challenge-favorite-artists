//
//  Artist+NSJSONSerialization.m
//  FavArtist
//
//  Created by Norlan Tibanear on 11/30/20.
//

#import "Artist+NSJSONSerialization.h"

@implementation Artist_NSJSONSerialization

- (nullable instancetype) initWithDictionary:(NSDictionary *)dictionary {
   
    NSString *artistName = [dictionary objectForKey:@"strArtist"];
    if ([artistName isKindOfClass:NSString.class]) return nil;
    
    NSNumber *formedYear = [dictionary objectForKey:@"intFormedYear"];
    if ([formedYear isKindOfClass:[NSString class]]) {
        formedYear = nil;
    } else {
        NSString *formedYear;
    }
    
    
}//



@end
