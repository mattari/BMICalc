//
//  BMICalcViewController.h
//  BMICalc
//
//  Created by 毅好 小板橋 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMICalcViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIAlertViewDelegate> {
    IBOutlet UITextField *heightText; // 身長テキストフィールド
    IBOutlet UITextField *weightText; // 体重テキストフィールド
    IBOutlet UIButton *calcButton;    // 計算ボタン
    IBOutlet UIButton *resetButton;   // リセットボタン
    IBOutlet UILabel *resultLabel;    // 結果ラベル
    IBOutlet UIButton *infoButton;    // infoボタン
}

@property (nonatomic, retain) UITextField *heightText;
@property (nonatomic, retain) UITextField *weightText;
@property (nonatomic, retain) UIButton *calcButton;
@property (nonatomic, retain) UIButton *resetButton;
@property (nonatomic, retain) UILabel *resultLabel;
@property (nonatomic, retain) UIButton *infoButton;

// 計算ボタンを押したときに呼ばれるメソッド
-(IBAction)executeCalc:(id)sender;
// リセットボタンを押したときに呼ばれるメソッド
-(IBAction)executeReset:(id)sender;
// infoボタンを押したときに呼ばれるメソッド
-(IBAction)executeInfo:(id)sender;

@end
