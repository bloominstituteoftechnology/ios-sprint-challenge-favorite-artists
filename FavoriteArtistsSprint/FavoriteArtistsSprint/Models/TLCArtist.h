//
//  TLCArtist.h
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/21/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLCArtist : NSObject 
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *artistBio;
@property (nonatomic) int yearFormed ;

-(instancetype)initWithName:(NSString *)name artistBio:(NSString *)artistBio yearFormed:(int)yearFormed;

-(NSString *)yearFormedString;
@end

NS_ASSUME_NONNULL_END
