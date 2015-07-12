//
//  CardMatching.m
//  MatchCards
//
//  Created by 布白 on 15/7/10.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import "MatchGame.h"

@interface MatchGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation MatchGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int CHOOSE_COST = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match this card against other cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.matched = YES;
                        card.matched = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        otherCard.chosen = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            card.chosen = YES;
            self.score -= CHOOSE_COST;
        }
    }
}

@end
