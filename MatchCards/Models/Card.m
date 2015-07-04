//
//  Card.m
//  MatchCards
//
//  Created by 布白 on 15/7/4.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([self.contents isEqualToString:card.contents]) {
            score++;
        }
    }
    
    return score;
}

@end
