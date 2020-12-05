//
//  NSJSONSerialization+SAEArtist.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 12/4/20.
//

//#import <Foundation/Foundation.h>
#import "SAEArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (SAEArtist)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
