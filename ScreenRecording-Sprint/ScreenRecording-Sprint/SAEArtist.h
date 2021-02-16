//
//  SAEArtist.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 12/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAEArtist : NSObject

- (instancetype)initWithArtistName:(NSString *)artistName
                        biography:(NSString *)biography
                       yearFormed:(int)yearFormed;

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int yearFormed;

@end

NS_ASSUME_NONNULL_END
