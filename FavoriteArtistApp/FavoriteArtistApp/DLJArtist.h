//
//  DLJArtist.h
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLJArtist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic) int yearFormed;

-(instancetype)initWithArtistName: (NSString *)name biography:(NSString *)bio yearFormed:(int)yearFormed;



@end

NS_ASSUME_NONNULL_END
