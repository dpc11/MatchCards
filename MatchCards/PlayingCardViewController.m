//
//  PlayingCardViewController.m
//  MatchCards
//
//  Created by 布白 on 15/7/20.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import "PlayingCardViewController.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end
