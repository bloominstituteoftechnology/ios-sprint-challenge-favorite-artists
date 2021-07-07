//
//  NSJSONSerialization+NYCNSJSONSerialization_Dictionary.h
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYCArtist.h"

typedef void (^NYCArtistFetcherCompletion)(NSDictionary *_Nullable, NSError *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (NYCNSJSONSerialization_Dictionary)

+ (void)nyc_fetchArtist:(NSString *)artist completion:(NYCArtistFetcherCompletion)completion;

@end

NS_ASSUME_NONNULL_END
