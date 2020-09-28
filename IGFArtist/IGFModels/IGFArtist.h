//
//  IGFArtist.h
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IGFArtist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *biography;
@property (nonatomic) int formedYear;

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography formedYear:(int)formedYear;

- (NSString *)formedYearString;

@end

NS_ASSUME_NONNULL_END
