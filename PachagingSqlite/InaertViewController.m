//
//  InaertViewController.m
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/24.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import "InaertViewController.h"
#import "SqliteManager.h"
#import "PersonModel.h"



@interface InaertViewController ()

@end



@implementation InaertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)insertAction:(id)sender {
    
    SqliteManager *manager = [SqliteManager shareManager];
    
    PersonModel *model = [[PersonModel alloc] init];
    model.name = _nameText.text;
    model.number = [_numberText.text integerValue];
    model.gender = _genderText.text;
    model.age = [_ageText.text integerValue];
    
    [manager insertWithModel:model];
}



@end
