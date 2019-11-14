//
//  MRFArtistController.h
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRFArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRFArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray *artists;
@property (nonatomic) NSURL  *persistentURL;
- (void)saveToPersistenceStoreWithArtist:(MRFArtist *)artist;
//- (void)saveToPersistenceStore;
- (void)loadFromPersistenceStore;
- (void)createArtistWithName:(NSString *)name
                  yearFormed:(NSString *)yearFormed
                         bio:(NSString *)bio;



@end

NS_ASSUME_NONNULL_END
