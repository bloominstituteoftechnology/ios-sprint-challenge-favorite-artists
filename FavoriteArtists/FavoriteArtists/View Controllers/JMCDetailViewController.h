//
//  JMCDetailViewController.h
//  FavoriteArtists
//
//  Created by Jarren Campos on 8/3/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JMCDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) JMCArtist *artist;

@end

NS_ASSUME_NONNULL_END
