//
//  PlayingCard.h
//  MatchCards
//
//  Created by 布白 on 15/7/4.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
