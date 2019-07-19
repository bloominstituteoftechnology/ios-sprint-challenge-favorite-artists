//
//  KRCArtistController.h
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KRCArtist.h"

typedef void (^KRCCompletion)(KRCArtist * _Nullable, NSError * _Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface KRCArtistController : NSObject

@property (nonatomic) NSArray *artistCollection;

- (void)fetchArtistNamed:(NSString *)name completion:(KRCCompletion)completion;

- (void)addArtist:(KRCArtist *)artist;

- (void)deleteArtist:(KRCArtist *)artist;

- (void)saveToFIle;

- (void)loadFile;

@end

NS_ASSUME_NONNULL_END
