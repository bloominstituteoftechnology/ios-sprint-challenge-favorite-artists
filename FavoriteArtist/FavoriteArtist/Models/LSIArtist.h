//
//  LSIArtist.h
//  FavoriteArtist
//
//  Created by Lambda_School_Loaner_214 on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *bio;
@property (nonatomic) int *formedDate;

-(instancetype)initWithName:(NSString *)name bio:(NSString *)bio formedDate:(int)formedDate;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
