//
//  ALWLyrics.m
//  

#import "ALWLyrics.h"

@implementation ALWLyrics

- (instancetype)initWithLyrics:(NSString *)lyrics_body {
    self = [super init];
    if (self != nil) {
        _lyrics_body = [lyrics_body copy];
    }
    return self;
}
    
//- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//    // Pull values out of the dicionary
//    NSDictionary *lyrics = dictionary[@"lyrics_body"];
//}
    
@end
