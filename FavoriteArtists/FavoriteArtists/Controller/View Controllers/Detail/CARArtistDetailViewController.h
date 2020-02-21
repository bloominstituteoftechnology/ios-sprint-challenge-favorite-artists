//
//  CARArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CARArtist+CoreDataProperties.h"
#import "CARArtist+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface CARArtistDetailViewController : UIViewController

@property (nonatomic) CARArtist *artist;

@end

NS_ASSUME_NONNULL_END
