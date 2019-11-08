//
//  JACArtist.m
//  Favorite Artists
//
//  Created by Jordan Christensen on 11/9/19.
//  Copyright © 2019 Mazjap Co. All rights reserved.
//

#import "JACArtist.h"

@implementation JACArtist
- (instancetype)initWithName:(NSString *)name yearFormed:(NSString *)yearFormed desc:(NSString *)desc {
    if (self = [super init]) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myNumber = [f numberFromString:yearFormed];
        if (yearFormed != nil) {
            _yearFormed = myNumber.intValue;
        } else {
            _yearFormed = 0;
        }
        
        _name = [name copy];
        _desc = [desc copy];
    }
    return self;
}

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

@end
