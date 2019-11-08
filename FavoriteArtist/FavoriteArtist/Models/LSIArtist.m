//
//  LSIArtist.m
//  FavoriteArtist
//
//  Created by Lambda_School_Loaner_214 on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

-(instancetype)initWithName:(NSString *)name bio:(NSString *)bio formedDate:(int)formedDate{
    if (self = [super init]) {
        _name = name;
        _bio = bio;
        _formedDate = &formedDate;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    NSDictionary *artistTopDictionary = dictionary[@"artists"];
    NSArray *artistArray = [artistTopDictionary allValues];
    NSDictionary *artistDictionary = [artistArray firstObject];
    NSString *name = artistDictionary[@"strArtist"];
    NSString *bio = artistDictionary[@"strBiographyEN"];
    int formedDate = [artistDictionary[@"intFormedYear"] intValue];
    return [self initWithName:name bio:bio formedDate:formedDate];
}

@end
