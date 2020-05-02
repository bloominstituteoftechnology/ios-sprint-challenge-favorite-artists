//
//  NSJSONSerialization+CCCNSJSONSerialization_Dictionary.h
//  ChallengeRewrite
//
//  Created by Ryan Murphy on 7/19/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCArtist.h"

typedef void (^CCCArtistFetchCompletion)(NSDictionary *_Nullable, NSError *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (CCCNSJSONSerialization_Dictionary)

+ (void)ccc_fetchArtist:(NSString *)artist completion:(CCCArtistFetchCompletion)completion;

@end

NS_ASSUME_NONNULL_END
