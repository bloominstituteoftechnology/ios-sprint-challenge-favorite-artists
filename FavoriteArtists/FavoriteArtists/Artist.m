//
//  Artist.m
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    if (self = [super init]) {
        
        //MAKE SURE THIS IS FILLED OUT THE APPROPRIATE WAY
        
        _identifier = [dictionary objectForKey:@"id"];
        
        NSDictionary *properties = [dictionary objectForKey:@"properties"];
        
        _name = [[properties objectForKey:@"ENTER NAME KEY"] string];
        _founded = [[properties objectForKey:@"ENTER FOUNDED KEY"] string];
        _details = [[properties objectForKey:@"ENTER DETAILS KEY"] string];
    }
    return self;
}

//MARK: - Equality

- (BOOL)isEqual:(Artist *)object
{
    if (self == object) return YES;
    if (![object isKindOfClass:[Artist class]]) return NO;
    
    return [_identifier isEqualToString:object.identifier];
}

@end
