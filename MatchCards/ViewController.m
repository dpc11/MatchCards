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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deckCards;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"翻转 : %2d", self.flipCount];
}

- (Deck *)deckCards {
    if (!_deckCards) {
        _deckCards = [[PlayingCardDeck alloc] init];
    }
    return _deckCards;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"Cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:nil forState:UIControlStateNormal];
        
        self.flipCount++;
    } else {
        Card *card = self.deckCards.drawRandomCard;
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"Cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:card.contents  forState:UIControlStateNormal];
            
            if ([card.contents containsString:@"♥︎"] || [card.contents containsString:@"♦︎"]) {
                [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            } else {
                [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
            
            self.flipCount++;
        }
    }
}

@end
