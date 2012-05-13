//
//  BMICalcViewController.m
//  BMICalc
//
//  Created by 毅好 小板橋 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BMICalcViewController.h"

@interface BMICalcViewController ()

@end

@implementation BMICalcViewController

@synthesize heightText;
@synthesize weightText;
@synthesize calcButton;
@synthesize resetButton;
@synthesize resultLabel;
@synthesize infoButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// 身長・体重テキストのキーボードを隠す処理
- (void)textFieldResignFirstResponder {
    [heightText resignFirstResponder];
    [weightText resignFirstResponder];
}

// UITextFieldDelegateプロトコルで定義されているイベントメソッド
// キーボードのReturnキーが押された後に呼ばれる
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self textFieldResignFirstResponder];
    return YES;
}

// 計算ボタンの Touch Down イベントに登録するBMI計算実行処理
- (IBAction)executeCalc:(id) sender {
    // キーボードを隠す
    [self textFieldResignFirstResponder];
    
    // 身長テキストフィールドに入力された値（cm）をメートルに変換
    float height = [heightText.text floatValue]/100;
    // 体重テキストフィールドに入力された値を取得
    float weight = [weightText.text intValue];
    
    // BMI = 体重（kg）÷ (身長（m） × 身長（m）)
    float bmi = weight / (height * height);
    
    // BMI計算結果（少数点第1位まで）
    NSString *bmiStr = [ NSString stringWithFormat: @"%.1f", bmi ];
    
    // 標準体重（kg） = 身長（m） × 身長（m） × BMI標準値（22）
    float stdWeight = (height * height) * 22;
    
    // 標準体重の計算結果（少数点第1位まで）を、標準体重ラベルに設定
    NSString *stdWeightStr = [ NSString stringWithFormat: @"%.1f", stdWeight ];
    
    // 結果判定を行う
    NSString *result = @"";
    
    // BMIが18.51より小さければ、[やせ気味]
    if (bmi < 18.5) {
        result = @"[やせ気味]です。";
        // BMIが18.5以上、25より小さければ、[理想の体重]
    } else if (bmi >= 18.5 && bmi < 25) {
        result = @"[理想の体重]です。";
        // それ以上の場合は、[肥満]
    } else {
        result = @"[肥満]です。";
    }
    
    // 判定結果を結果ラベルに設定
    resultLabel.text = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                        @"BMI\n", bmiStr, 
                        @"\n\n標準体重\n", stdWeightStr, @"kg\n\n",
                        result];
}

// リセット処理
- (IBAction)executeReset:(id) sender {
	[self textFieldResignFirstResponder];
    // 各値をクリア
    heightText.text = @"";
    weightText.text = @"";
    resultLabel.text = @"";
}

// このクラスのインスタンスが解放されるときに呼び出される
/*
- (void)dealloc {
    [heightText release];
    [weightText release];
    [calcButton release];
    [resetButton release];
    [resultLabel release];
    [super dealloc];
}
*/

- (IBAction)executeInfo:(id) sender {
    UIAlertView *alert = [ [UIAlertView alloc] 
						  initWithTitle:@"Info"
						  message:@"BMI Calculate Application"
						  delegate:self
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
    [alert show];
}

@end
