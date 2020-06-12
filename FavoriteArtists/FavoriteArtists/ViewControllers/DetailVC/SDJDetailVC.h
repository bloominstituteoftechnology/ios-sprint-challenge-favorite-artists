//
//  SDJDetailVC.h
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDJArtistClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDJDetailVC : UIViewController

@property (nonatomic, assign) SDJArtistClient *artistClient;
@property (nonatomic, assign) SDJArtist *artist;

@end

NS_ASSUME_NONNULL_END
