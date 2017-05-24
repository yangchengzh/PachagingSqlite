//
//  SeleteViewController.m
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/24.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import "SeleteViewController.h"
#import "SqliteManager.h"


@interface SeleteViewController ()
{
    SqliteManager *manager;
}

@end

@implementation SeleteViewController

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

- (IBAction)selete:(id)sender {
    [manager selertWithAge:[_ageText.text integerValue]];
}

- (IBAction)seleteAll:(id)sender {
    
    [manager selertAll];
}
@end
