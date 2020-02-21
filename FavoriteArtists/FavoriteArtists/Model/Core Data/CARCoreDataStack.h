//
//  CARCoreDataStack.h
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CARCoreDataStack : NSObject

@property (nonatomic, readonly) NSManagedObjectContext *viewContext;

@end

NS_ASSUME_NONNULL_END
