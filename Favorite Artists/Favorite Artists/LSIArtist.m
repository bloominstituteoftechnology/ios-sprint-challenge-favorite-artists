//
//  LSIArtist.m
//  Favorite Artists
//
//  Created by Isaac Lyons on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        NSString *name = dictionary[@"strArtist"];
        NSString *biography = dictionary[@"strBiographyEN"];
        NSString *yearString = dictionary[@"intFormedYear"];
        
        _name = name;
        _biography = biography;
        _year = 0;
        
        if (yearString) {
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
            
            NSNumber *yearNumber = [formatter numberFromString:yearString];
            if(yearNumber) {
                _year = [yearNumber intValue];
            }
        }
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    
    [dictionary setValue:self.name forKey:@"strArtist"];
    [dictionary setValue:self.biography forKey:@"strBiographyEN"];
    
    if (self.year > 0) {
        [dictionary setValue:[NSString stringWithFormat:@"%d", self.year] forKey:@"intFormedYear"];
    }
    
    return dictionary;
}

@end
