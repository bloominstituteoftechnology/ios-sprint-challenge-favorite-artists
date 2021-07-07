//
//  FCCArtist.h
//  Lyric Finder
//
//  Created by Lambda_School_Loaner_34 on 4/5/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCCArtist : NSObject

@property NSString *artist;
@property NSInteger year;
@property NSString *biography;

- (instancetype)initWithArtist:(NSString *)artist year:(NSInteger)year biography:(NSString *)biography;


@end

NS_ASSUME_NONNULL_END
