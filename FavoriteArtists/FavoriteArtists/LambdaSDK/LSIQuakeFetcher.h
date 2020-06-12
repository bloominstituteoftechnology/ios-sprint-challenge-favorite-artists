//
//  LSIQuakeFetcher.h
//  Quakes-Objc
//
//  Created by Bhawnish Kumar on 6/11/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LSIQuake;
typedef void (^LSIQuakeFetcherCompletion)(NSArray<LSIQuake *> *_Nullable quakes, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface LSIQuakeFetcher : NSObject

- (void)fetchQuakesTimeInterval:(NSDateInterval *)interval completion:(LSIQuakeFetcherCompletion)completion;
//                     completion:(void (^)(NSArray<LSIQuake *> *quakes, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
