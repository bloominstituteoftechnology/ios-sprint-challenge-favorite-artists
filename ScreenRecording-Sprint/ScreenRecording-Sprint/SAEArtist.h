//
//  SAEArtist.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 12/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAEArtist : NSObject

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int formedYear;

- (instancetype)initWithArtistName:(NSString *)aName
                         biography:(NSString *)aBiography
                        formedYear:(int)aYear;

@end

NS_ASSUME_NONNULL_END
