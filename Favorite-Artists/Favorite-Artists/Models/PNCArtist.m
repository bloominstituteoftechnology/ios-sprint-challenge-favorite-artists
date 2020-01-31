//
//  PNCArtist.m
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "PNCArtist.h"

@implementation PNCArtist

- (NSString *)description {
    return [NSString stringWithFormat:@"Name: %@, Year: %d", self.name, self.year];
}

@end
