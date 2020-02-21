//
//  TLCArtist.m
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/21/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCArtist.h"

@implementation TLCArtist

-(instancetype)initWithName:(NSString *)name artistBio:(NSString *)artistBio yearFormed:(int)yearFormed {
    self = [self init];
    if (self) {
        _name = name;
        _artistBio = artistBio;
        _yearFormed = yearFormed;
    }
    return self;
}
-(NSString *)yearFormedString {
    return [[NSNumber numberWithInt: self.yearFormed] stringValue];
}



@end
