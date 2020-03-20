//
//  Artist+Persistance.h
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (Persistance)

- (void)saveToPersistantStore:(NSDictionary *)dictionary;
- (void)removeFromPersistantStore:(NSNumber *)number;
- (NSMutableArray *)getFromPersistantStore;

@end

NS_ASSUME_NONNULL_END
