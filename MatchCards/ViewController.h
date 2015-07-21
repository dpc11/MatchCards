//
//  ViewController.h
//  MatchCards
//
//  Created by 布白 on 15/7/3.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

// Abstruct Class

@interface ViewController : UIViewController

- (Deck *)createDeck;   // Abstruct Method

@end
