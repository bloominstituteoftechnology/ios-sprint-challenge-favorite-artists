//
//  FavoriteArtistsViewController.h
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"
#import "ArtistFetcher.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtistsViewController : UIViewController

@property (nonatomic, retain) NSDictionary *artistDictionary;
@property(readonly, copy) NSArray<Artist *> *allValues;
@property (nonatomic) ArtistFetcher *artistFetcher;

//+ (NSDictionary<NSString *,Artist *> *)dictionaryWithContentsOfURL:(NSURL *)url
//                                                               error:(NSError * _Nullable *)error;

- (BOOL)writeToURL:(NSURL *)url
             error:(NSError * _Nullable *)error;

@end

NS_ASSUME_NONNULL_END
