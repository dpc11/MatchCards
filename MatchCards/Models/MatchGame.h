//
//  CardMatching.h
//  MatchCards
//
//  Created by 布白 on 15/7/10.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface MatchGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
