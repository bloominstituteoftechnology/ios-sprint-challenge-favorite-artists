//
//  CNSArtistModel.h
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/12/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//creating
//👇 tells compiler there is a class with this name
@class CNSArtistModel;
@interface CNSArtistModel : NSObject
@property NSString *artistName;
@property NSString *artistBio;
@property int formedYear;

-(instancetype)initWithArtistName:(NSString *)name biography:(NSString *)bio andFormedYear:(int)year;


@end

NS_ASSUME_NONNULL_END
