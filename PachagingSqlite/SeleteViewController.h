//
//  SeleteViewController.h
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/24.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeleteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ageText;
- (IBAction)selete:(id)sender;

- (IBAction)seleteAll:(id)sender;


@end
