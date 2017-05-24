//
//  InaertViewController.h
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/24.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InaertViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *numberText;
@property (weak, nonatomic) IBOutlet UITextField *genderText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
- (IBAction)insertAction:(id)sender;


@end
