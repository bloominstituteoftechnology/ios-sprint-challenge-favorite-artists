//
//  JACArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Jordan Christensen on 11/9/19.
//  Copyright © 2019 Mazjap Co. All rights reserved.
//

#import "JACArtist+NSJSONSerialization.h"

@implementation JACArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        NSArray *list = dictionary[@"artists"];
        
        if ([list objectAtIndex:0]) {
            NSString *name = [[list objectAtIndex:0] valueForKeyPath:@"strArtist"];
            NSString *yearFormed = [[list objectAtIndex:0] valueForKeyPath:@"intFormedYear"];
            NSString *desc = [[list objectAtIndex:0] valueForKeyPath:@"strBiographyEN"];
            
            return [self initWithName:name yearFormed:yearFormed desc:desc];
        }
    }
    return nil;
}

- (NSDictionary *)toDictionary {
    NSDictionary *dictionary = @{@"name":self.name,
                                 @"yearFormed":[NSNumber numberWithInt:self.yearFormed],
                                 @"description":self.desc };
    return dictionary;
}

@end
