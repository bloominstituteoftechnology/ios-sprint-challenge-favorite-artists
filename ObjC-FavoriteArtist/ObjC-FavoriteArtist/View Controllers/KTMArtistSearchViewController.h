//
//  KTMArtistSearchViewController.h
//  ObjC-FavoriteArtist
//
//  Created by Kobe McKee on 7/19/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTMArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KTMArtistSearchViewController : UIViewController
@property KTMArtistController *artistController;
@property KTMArtist *searchedArtist;
@end

NS_ASSUME_NONNULL_END
