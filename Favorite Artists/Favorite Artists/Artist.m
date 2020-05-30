//
//  Artist.m
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import "SBAArtist.h"

@implementation SBAArtist

- (instancetype)initWithArtistName:(NSString *)name
                         biography:(NSString *)biography
                        yearFormed:(int)yearFormed
{
  if (self = [super init]) {
    _name = name;
    _biography = biography;
    _yearFormed = yearFormed;
  }
  return self;
}
@end
