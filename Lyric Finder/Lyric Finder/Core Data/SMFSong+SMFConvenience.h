//
//  SMFSong+SMFConvenience.h
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFSong+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMFSong (SMFConvenience)

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
