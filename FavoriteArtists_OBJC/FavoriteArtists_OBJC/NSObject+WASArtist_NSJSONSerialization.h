//
//  NSObject+WASArtist_NSJSONSerialization.h
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 2/21/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

typedef void (^WASArtistCompletionBlock)(NSDictionary *_Nullable, NSError *_Nullable);


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WASArtist_NSJSONSerialization)

- (void)fetchArtist:(NSString *)artist completion:(WASArtistCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
