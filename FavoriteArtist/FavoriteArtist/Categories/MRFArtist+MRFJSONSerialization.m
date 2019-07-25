//
//  MRFArtist+MRFJSONSerialization.m
//  FavoriteArtist
//
//  Created by Michael Flowers on 7/24/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtist+MRFJSONSerialization.h"

@implementation MRFArtist (MRFJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)myDictionary {
    
    self = [super init];
    
    if (self){
        
            //initialize from dictionary, you have to 1. pull out the variables from the dictionary using json keys
        NSString *artistName = myDictionary[@"strArtist"];
        NSString *yearFormed = myDictionary[@"intFormedYear"];
        NSString *bio = myDictionary[@"strBiographyEN"];
        
        //2.check that all variables are not nil
        if (artistName != nil && yearFormed != nil && bio != nil){
            //3. create an artist - also handles all the copying in the property declaration
            self = [self initWithArtistName:artistName yearFormed:yearFormed bio:bio];
        } else {
            NSLog(@"Invalid Artist: %@ Json Object", artistName);
            self = nil;
        }
    }
    return self;
}

- (NSDictionary *)toDictionary{
    //take your model and turn it into a dictionary so that  you can use when you are saving to persistence store
    //We are returning a dictionary so we have to create one
    NSDictionary *result = @{
                             @"strArtist": self.artist,
                             @"intFormedYear": self.yearFormed,
                             @"strBiographyEN": self.bio
                             };
    return result;
}










@end
