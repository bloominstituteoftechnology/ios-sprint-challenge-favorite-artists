//
//  ArtistController.h
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

typedef void(^completionHandler)(NSDictionary * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);

- (void)fetchJson:(completionHandler)completion
             name:(NSString *)name;
- (void)getArtist:(NSString *)name
       completion:(void (^)(Artist *))completion;

@end

NS_ASSUME_NONNULL_END
