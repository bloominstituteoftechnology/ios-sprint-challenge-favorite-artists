//
//  FCCArtist.m
//  Lyric Finder
//
//  Created by Lambda_School_Loaner_34 on 4/5/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

#import "FCCArtist.h"

@implementation FCCArtist

- (instancetype)initWithArtist:(NSString *)artist year:(NSInteger)year biography:(NSString *)biography;
{
    
    self = [super init];
    if (self) {
        _artist = artist;
        _year = year;
        _biography = biography;
        
    }
    return self;
}


@end
