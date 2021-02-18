//
//  SAEArtist+NSJSONSerialization.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 2/15/21.
//

#import "SAEArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface SAEArtist (NSJSONSerialization)

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
