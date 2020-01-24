//
//  NMKArtistController.h
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NMKArtist;
@interface NMKArtistController : NSObject

@property (nonatomic, readonly) NSArray<NMKArtist *> *artists; // TODO: see if NSArray can only be used without declaring NMKArtist as the type (star wars project reference)

- (void)addArtist;
- (void)loadAritst;
- (void)saveArtist;
- (void)fetchArtist:(NSString *)searchTerm
         completion:(void (^)(NMKArtist *artist, NSError *error))completion;


@end

