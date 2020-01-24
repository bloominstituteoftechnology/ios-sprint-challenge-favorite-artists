//
//  LSIArtistController.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"


@implementation LSIArtistController

- (void)createArtistWithName:(NSString *)name
                          biography:(NSString *)biography
                         yearFormed:(int)yearFormed {
    
    NSNumber *yearNumber = [NSNumber numberWithInt:yearFormed];
    
    LSIArtist *artist = [[LSIArtist alloc]initWithName:name biography:biography yearFormed:yearNumber];
    
}

//- (void)updateArtist:(LSIArtist *)artist withName:(NSString *)name
//           biography:(NSString *)biography
//          yearFormed:(int)yearFormed {
//    
//}

- (void)deleteDocument:(LSIArtist *)artist {
    
}

@end
