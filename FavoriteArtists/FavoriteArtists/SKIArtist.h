//
//  SKIArtist.h
//  FavoriteArtists
//
//  Created by Joshua Rutkowski on 5/31/20.
//

#import <Foundation/Foundation.h>

@interface SKIArtist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) int year;
@property (nonatomic, copy)NSString *about;

- (instancetype)initWithName:(NSString *)name
                        year:(int)year
                       about:(NSString *)about;

@end

