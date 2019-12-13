//
//  GIPArtist.h
//  Favorite-Artists
//
//  Created by Gi Pyo Kim on 12/13/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GIPArtist : NSObject

@property NSString *name;
@property NSString *biography;
@property int yearFormed;

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed;

@end

