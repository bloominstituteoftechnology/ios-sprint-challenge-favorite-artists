//
//  Artist.m
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import "Artist.h"

@implementation Artist

//MARK: - Equality

- (BOOL)isEqual:(Artist *)object
{
    if (self == object) return YES;
    if (![object isKindOfClass:[Artist class]]) return NO;
    
    return [_identifier isEqualToString:object.identifier];
}

@end
