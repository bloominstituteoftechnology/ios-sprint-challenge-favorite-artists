//
//  ALWLyrics.h
//  

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALWLyrics : NSObject
    
@property NSString *lyrics_body;
    
- (instancetype)initWithLyrics:(NSString *)lyrics_body;
//- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
