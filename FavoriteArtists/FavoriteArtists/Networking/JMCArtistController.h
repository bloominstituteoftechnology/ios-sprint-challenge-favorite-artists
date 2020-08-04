//
//  JMCArtistController.h
//  FavoriteArtists
//
//  Created by Jarren Campos on 8/3/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JMCArtistController : NSObject

typedef void(^completionHandler)(NSDictionary * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);

- (void)fetchJson:(completionHandler)completion
             name:(NSString *)name;
- (void)getArtist:(NSString *)name
       completion:(void (^)(JMCArtist *))completion;

@end

NS_ASSUME_NONNULL_END
