//
//  ViewController.m
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/23.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import "ViewController.h"
#import "InaertViewController.h"
#import "SeleteViewController.h"
#import "UpdateViewController.h"
#import "DeleteViewController.h"
#import <sqlite3.h>
#import "SqliteManager.h"




@interface ViewController () {
    
    SqliteManager *manager;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setFrame:CGRectMake(135, 100, 100, 50)];
    addButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [addButton setTitle:@"插入" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(insert) forControlEvents:UIControlEventTouchUpInside];
    addButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:addButton];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteButton setFrame:CGRectMake(135, 200, 100, 50)];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    deleteButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:deleteButton];
    
    UIButton *updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [updateButton setFrame:CGRectMake(135, 300, 100, 50)];
    updateButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [updateButton setTitle:@"修改" forState:UIControlStateNormal];
    [updateButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [updateButton addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
    updateButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:updateButton];
    
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectButton setFrame:CGRectMake(135, 400, 100, 50)];
    selectButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [selectButton setTitle:@"查询" forState:UIControlStateNormal];
    [selectButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [selectButton addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
    selectButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:selectButton];
    
    manager = [SqliteManager shareManager];
    [manager creatTable];
}



- (void)insert
{
    InaertViewController *insertVC = [[InaertViewController alloc] init];
    [self.navigationController pushViewController:insertVC animated:YES];
}

- (void)delete
{
    DeleteViewController *insertVC = [[DeleteViewController alloc] init];
    [self.navigationController pushViewController:insertVC animated:YES];
    
}

- (void)update
{
    
    UpdateViewController *insertVC = [[UpdateViewController alloc] init];
    [self.navigationController pushViewController:insertVC animated:YES];
}

- (void)select
{
    
    SeleteViewController *insertVC = [[SeleteViewController alloc] init];
    [self.navigationController pushViewController:insertVC animated:YES];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
