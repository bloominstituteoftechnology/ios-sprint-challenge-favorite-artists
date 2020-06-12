//
//  HAOArtistViewController.h
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HAOArtist;

NS_ASSUME_NONNULL_BEGIN

@protocol HAOArtistViewDelegate <NSObject>

- (void)didSaveArtist:(HAOArtist *)artist;

@end

@interface HAOArtistViewController : UIViewController

@property (nonatomic, weak) id<HAOArtistViewDelegate> delegate;
@property HAOArtist *artist;

@end

NS_ASSUME_NONNULL_END
