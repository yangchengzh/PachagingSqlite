//
//  DeleteViewController.m
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/24.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import "DeleteViewController.h"
#import "SqliteManager.h"

@interface DeleteViewController ()
{
    SqliteManager *manager;
}

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    manager = [SqliteManager shareManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deleteAction:(id)sender {
    if (_nameText.text.length == 0) {
        [manager delateWithAge:[_ageText.text integerValue]];
    } else {
        [manager delateWithName:_nameText.text];
    }
    
}


@end
