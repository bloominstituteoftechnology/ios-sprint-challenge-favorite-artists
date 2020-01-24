//
//  SKSArtist.m
//  unit4-sprintchallenge2-ss
//
//  Created by Lambda_School_Loaner_204 on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "SKSArtist.h"

@implementation SKSArtist

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography birthYear:(int)birthYear {
    self = [self init];
    if (self) {
        _name = name;
        _biography = biography;
        _birthYear = birthYear;
    }
    return self;
}

@end
