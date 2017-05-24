//
//  UpdateViewController.h
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/24.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;

- (IBAction)updateAction:(id)sender;


@end
