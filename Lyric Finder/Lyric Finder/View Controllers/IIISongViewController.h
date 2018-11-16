//
//  IIISongViewController.h
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IIISong;
@class IIISongController;

NS_ASSUME_NONNULL_BEGIN

@interface IIISongViewController : UIViewController

@property (nonatomic) IIISong *song;
@property (nonatomic) IIISongController *songController;

@end

NS_ASSUME_NONNULL_END
