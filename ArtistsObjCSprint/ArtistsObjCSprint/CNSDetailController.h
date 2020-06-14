//
//  CNSDetailController.h
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/13/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CNSArtistController;
@class CNSArtistModel;

@interface CNSDetailController : UIViewController <UISearchBarDelegate>
@property CNSArtistController *controller;
@property CNSArtistModel *artist;
@end

NS_ASSUME_NONNULL_END
