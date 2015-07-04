//
//  ViewController.m
//  MatchCards
//
//  Created by 布白 on 15/7/3.
//  Copyright (c) 2015年 DPC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

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
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips : %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"Cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:nil forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"Cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A ♣︎" forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
