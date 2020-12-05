//
//  SAEArtist.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 12/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAEArtist : NSObject

- (instancetype)initWithArtist:(NSString *)artist
                        biography:(NSString *)biography
                       yearFormed:(int)yearFormed;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *biography;
@property (nonatomic) int yearFormed;

@end

NS_ASSUME_NONNULL_END
