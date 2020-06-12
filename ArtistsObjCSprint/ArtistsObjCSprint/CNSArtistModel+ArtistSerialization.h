//
//  CNSArtistModel+ArtistSerialization.h
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/12/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSArtistModel.h"
#import "CNSArtistModel+ArtistSerialization.h"
NS_ASSUME_NONNULL_BEGIN

@interface CNSArtistModel (ArtistSerialization)
- (instancetype) initWithDictionary: (NSDictionary *)dictionary;
-(NSDictionary *)artistData;
@end

NS_ASSUME_NONNULL_END
