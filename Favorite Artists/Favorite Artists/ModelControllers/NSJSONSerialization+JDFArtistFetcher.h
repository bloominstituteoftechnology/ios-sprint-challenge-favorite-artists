//
//  NSJSONSerialization+JDFArtistFetcher.h
//  Favorite Artists
//
//  Created by Jonathan Ferrer on 7/19/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^JDFArtistFetchCompletionBlock)(NSDictionary *_Nullable, NSError *_Nullable);


NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (JDFArtistFetcher)

+ (void)fetchArtist:(NSString *)artist completion:(JDFArtistFetchCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
