//
//  ViewController.m
//  MatchCards
//
//  Created by 布白 on 15/7/3.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "MatchGame.h"

@interface ViewController ()

@property (nonatomic, strong) Deck *deckCards;
@property (nonatomic, strong) MatchGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

- (Deck *)deckCards {
    if (!_deckCards) {
        _deckCards = [[PlayingCardDeck alloc] init];
    }
    return _deckCards;
}

- (MatchGame *)game {
    if (!_game) {
        _game = [[MatchGame alloc] initWithCardCount:[self.cardButtons count]
                                           usingDeck:self.deckCards];
    }
    return _game;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI {
    // update score label
    self.scoreLabel.text = [NSString stringWithFormat:@"分数:%3ld", self.game.score];
    
    // update deck of cards
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setBackgroundImage:[self backImgForCard:card]
                              forState:UIControlStateNormal];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        if ([card.contents containsString:@"♥︎"] || [card.contents containsString:@"♦︎"]) {
            [cardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            [cardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        cardButton.enabled = !card.isMatched;
    }
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : nil;
}

- (UIImage *)backImgForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"CardBack"];
}

@end
