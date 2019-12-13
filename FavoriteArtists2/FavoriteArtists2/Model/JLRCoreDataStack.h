//
//  JLRCoreDataStack.h
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLRCoreDataStack : NSObject

+ (JLRCoreDataStack *)sharedStack;

@property (nonatomic, readonly) NSPersistentContainer *container;
@property (nonatomic, readonly) NSManagedObjectContext *mainContext;

@end

NS_ASSUME_NONNULL_END
