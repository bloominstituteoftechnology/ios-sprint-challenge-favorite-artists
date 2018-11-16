//
//  IIISong+IIIJSONSerialization.h
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIISong.h"

NS_ASSUME_NONNULL_BEGIN

@interface IIISong (IIIJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
