//
//  SqliteManager.h
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/23.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "PersonModel.h"

@interface SqliteManager : NSObject

+ (SqliteManager *)shareManager;

- (sqlite3 *)openDB;//打开数据库
- (void)closeDB;//关闭数据库
- (void)creatTable;//创建表
- (void)insertWithModel:(PersonModel *)model;//添加数据
- (void)updateWithName:(NSString *)name byAge:(NSInteger)age;//通过age更新数据
- (void)delateWithName:(NSString *)name;//通过name删除
- (void)delateWithAge:(NSInteger)age;//通过age删除
- (void)selertAll;//查询全部
- (void)selertWithAge:(NSInteger)age;//通过age查询某一条

@end
