//
//  DSCArtist.m
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCArtist.h"

@implementation DSCArtist

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                        year:(int)year {
   if (self = [super init]) {
       _name = [name copy];
       _biography = [biography copy];
       _year = year;
    }
    return self;
}

@end
