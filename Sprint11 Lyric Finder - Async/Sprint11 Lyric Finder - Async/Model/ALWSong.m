//
//  ALWSong.m
//  

#import "ALWSong.h"

@implementation ALWSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating {
    self = [super init];
    if (self) {
        _title = [title copy];
        _artist = [artist copy];
        _lyrics = [lyrics copy];
        _rating = rating;
    }
    return self;
}

//- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//    
//    // Pull out lyrics from dictionary
//    NSString *lyrics = dictionary[@"lyrics_body"];
//    
//    // Check to make sure it's not nil
//    if (lyrics == nil) {
//        return nil;
//    }
//    
//    // Initialize an object with the lyrics received from the dictionary
//    return [self initWithLyrics:lyrics];
//}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary title:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating {
    _title = [title copy];
    _artist = [artist copy];
    _rating = rating;
    
    lyrics = dictionary[@"lyrics_body"];
    
    if (lyrics == nil) {
        return nil;
    }
    
    return [self initWithTitle:title artist:artist lyrics:lyrics rating:rating];
}






@end
