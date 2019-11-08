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
        _name = [name copy];
        _yearFormed = [yearFormed copy];
        _desc = [desc copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        NSString *name = [dictionary valueForKeyPath:@""];
        NSString *yearFormed = [dictionary valueForKeyPath:@""];
        NSString *desc = [dictionary valueForKeyPath:@""];
        
        return [self initWithName:name yearFormed:yearFormed desc:desc];
    }
    return nil;
}

@end
