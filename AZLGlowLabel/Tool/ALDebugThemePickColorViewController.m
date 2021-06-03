//
//  ALDebugThemePickColorViewController.m
//  tasker
//
//  Created by lizihong on 2020/11/13.
//  Copyright © 2020 BT. All rights reserved.
//

#import "ALDebugThemePickColorViewController.h"

@interface ALDebugThemePickColorViewController ()
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *colorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;

@end

@implementation ALDebugThemePickColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.colorView.layer.borderWidth = 1;
    self.colorView.layer.borderColor = UIColor.lightGrayColor.CGColor;
    
    UIColor *color = self.color;
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    self.alphaSlider.value = alpha;
    
    self.colorNameLabel.text = self.colorName;
    
    [self updateColor];
}

- (void)updateColor{
    CGFloat red, green, blue, alpha;
    red = self.redSlider.value;
    green = self.greenSlider.value;
    blue = self.blueSlider.value;
    alpha = self.alphaSlider.value;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    long long colorValue = (long long)((long)(alpha*255)*256*256*256+(long)(red*255)*256*256+(long)(green*255)*256+(long)(blue*255));
    self.colorValueLabel.text = [NSString stringWithFormat:@"%llx", colorValue];
    self.redLabel.text = [NSString stringWithFormat:@"%x", (int)(red*255)];
    self.greenLabel.text = [NSString stringWithFormat:@"%x", (int)(green*255)];
    self.blueLabel.text = [NSString stringWithFormat:@"%x", (int)(blue*255)];
    self.alphaLabel.text = [NSString stringWithFormat:@"%0.2f", alpha];
    
    self.colorView.backgroundColor = color;
}

- (IBAction)redSliderChange:(UISlider *)sender {
    [self updateColor];
}

- (IBAction)greenSliderChange:(UISlider *)sender {
    [self updateColor];
}

- (IBAction)blueSliderChange:(UISlider *)sender {
    [self updateColor];
}
- (IBAction)alphaSliderChange:(id)sender {
    [self updateColor];
}

- (IBAction)cancelDidTap:(id)sender {
    UIColor *color = self.colorView.backgroundColor;
    if (self.completeBlock) {
        self.completeBlock(color);
    }
    [self dismissViewControllerAnimated:false completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
