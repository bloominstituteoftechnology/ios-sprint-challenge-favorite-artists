//
//  IGFArtist.m
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import "IGFArtist.h"

@implementation IGFArtist

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography formedYear:(int)formedYear {
    self = [self init];
    if (self) {
        _name = name;
        _biography = biography;
        _formedYear = formedYear;
    }
    return self;
}

- (NSString *)formedYearString {
    return [[NSNumber numberWithInt:self.formedYear] stringValue];
}


@end
