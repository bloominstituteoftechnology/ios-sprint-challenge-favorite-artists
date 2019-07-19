//
//  KRCArtist.m
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import "KRCArtist.h"

@implementation KRCArtist

- (instancetype)initWithName:(NSString *)name year:(NSInteger)year bio:(nonnull NSString *)bio {
    
    if (self = [super init]) {
        _artistName = name;
        _yearFormed = year;
        _bio = bio;
    }
    
    return self;
}

- (instancetype)initWithFetchedJSON:(NSDictionary *)json{
    
    if (self = [super init]) {
        
//        _pokemonName = [json objectForKey:@"name"];
//        _pokemonExperience = [[json objectForKey:@"base_experience"] integerValue];
//
//        NSArray *abilitiesJson = [json objectForKey:@"abilities"];
//        NSMutableArray *abilities = [[NSMutableArray alloc] init];
//
//        for(int i = 0; i < [abilitiesJson count]; i++) {
//
//            NSDictionary *abilityContainer = abilitiesJson[i];
//            NSDictionary *ability = [abilityContainer objectForKey:@"ability"];
//            NSString *abilityName = [ability objectForKey:@"name"];
//            [abilities addObject:abilityName];
//        }
//
//        _pokemonAbilities = abilities;
//
//        NSDictionary *imageJson = [json objectForKey:@"sprites"];
//        _pokemonImageURL = [imageJson objectForKey:@"front_default"];
    }
    
    return self;
}

- (instancetype)initWithFileJSON:(NSDictionary *)json {
    
    if (self = [super init]) {
        
    }
    
    return self;
}

@end
