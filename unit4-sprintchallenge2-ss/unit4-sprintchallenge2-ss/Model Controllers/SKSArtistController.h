//
//  SKSArtistController.h
//  unit4-sprintchallenge2-ss
//
//  Created by Lambda_School_Loaner_204 on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SKSArtist;

@interface SKSArtistController : NSObject

@property (nonatomic, readonly) NSArray *artists;

- (void)searchForArtistsByName:(NSString *)name completion:(void (^)(SKSArtist *artist, NSError *error))completion;

- (NSURL *)artistsFileURL;

@end

