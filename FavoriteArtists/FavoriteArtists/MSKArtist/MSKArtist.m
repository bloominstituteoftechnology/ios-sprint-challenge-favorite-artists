//
//  MSKArtist.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/16/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import "MSKArtist.h"

@implementation MSKArtist: NSObject
- (instancetype)initWithName:(NSString *)artistName
             artistBiography:(NSString *)artistBiography
                  yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _artistName = [artistName copy];
        _artistBiography = [artistBiography copy];
        _yearFormed = yearFormed;
    }
    return self;
}
@end
