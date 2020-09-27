//
//  JSKAddArtistViewController.h
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import <UIKit/UIKit.h>

@class JSKArtist;
@class JSKArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface JSKAddArtistViewController : UIViewController<UISearchBarDelegate>

@property (nonatomic, nullable) JSKArtist *artist;
@property (nonatomic, nullable) JSKArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
