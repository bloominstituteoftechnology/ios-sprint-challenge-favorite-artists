//
//  CNSArtistModel.m
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/12/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSArtistModel.h"

@implementation CNSArtistModel
//creating a self initializer for the model.
-(instancetype)initWithArtistName:(NSString *)name biography:(NSString *)bio andFormedYear:(int)year
{
    if (self = [super init])
    {
        _artistName = name;
        _artistBio = bio;
        _formedYear = year;
    }
    return self;
}

@end
