//
//  IGFArtist+NSJONSerialization.h
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//


#import "IGFArtist.h"


@interface IGFArtist (NSJONSerialization)

//Add an initializer to create your model object from a `NSDictionary`.

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

//Add a method that returns your model object as a `NSDictionary` (to save artists).

- (NSDictionary *)toDictionary;

@end
