//
//  Artists.m
//  Artist
//
//  Created by Lambda_School_Loaner_241 on 9/25/20.
//

#import "Artists.h"

@implementation Artists

- (instancetype)initWithName: (NSString *)artistName bio: (NSString *)artistBio year: (double) yr
{
    if(self = [super init]){
        _name = artistName;
        _bio = artistBio;
        _year = yr;
    }
    
    return self;
}

@end
