//
//  TLCDetailViewController.h
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/23/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TLCArtist;

@interface TLCDetailViewController : UIViewController

@property (nonatomic) TLCArtist *artist;
@property (nonatomic) NSString *name;

@end

NS_ASSUME_NONNULL_END
