//
//  MyArtist.h
//  FavoriteArtists
//
//  Created by Gladymir Philippe on 11/22/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyArtist : NSObject

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int yearFormed;

- (instancetype)initWithArtist:(NSString *)artist
                     biography:(NSString *)biography
                    yearFromed:(int)yearFormed;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
