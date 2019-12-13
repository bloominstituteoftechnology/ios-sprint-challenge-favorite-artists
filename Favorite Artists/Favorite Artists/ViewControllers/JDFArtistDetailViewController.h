//
//  JDFArtistDetailViewController.h
//  Favorite Artists
//
//  Created by Jonathan Ferrer on 7/19/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDFArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDFArtistDetailViewController : UIViewController<UISearchBarDelegate>


@property (atomic) NSMutableArray *_Nullable artists;
@property (nonatomic) JDFArtist *artist;

@end

NS_ASSUME_NONNULL_END
