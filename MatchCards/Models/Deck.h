//
//  Deck.h
//  MatchCards
//
//  Created by 布白 on 15/7/4.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
