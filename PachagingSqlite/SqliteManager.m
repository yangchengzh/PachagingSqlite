//
//  SqliteManager.m
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/23.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import "SqliteManager.h"

@implementation SqliteManager

+ (SqliteManager *)shareManager
{
    static SqliteManager *manager = nil;
    if (manager == nil) {
        manager = [[SqliteManager alloc] init];
    }
    return manager;
}

static sqlite3 *db;
- (sqlite3 *)openDB
{
    //  说明已经打开数据库
    if (db != nil) {
        return db;
    }
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [doc stringByAppendingPathComponent:@"perple.sqlite"];
    
    //将OC字符串转换为c语言的字符串
    const char *cfileName = fileName.UTF8String;
    //打开数据库文件（如果数据库文件不存在，该函数就会自动创建数据库文件）
    int result = sqlite3_open(cfileName, &db);
    if (result == SQLITE_OK) {
        NSLog(@"数据库已打开");
    } else {
        NSLog(@"数据库打开失败");
    }
    return db;
}

- (void)closeDB
{
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        NSLog(@"数据库已关闭");
        db = nil;
    } else {
        NSLog(@"数据库关闭失败");
    }
}

- (void)creatTable
{
    db = [self openDB];
    NSString *sql = @"create table IF NOT EXISTS perpleTable(number integer primary key not NULL, name text not NULL, gender text not NULL, age integer not NULL)";
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"创建表成功");
    } else {
        NSLog(@"创建表失败");
    }
    [self closeDB];
}

- (void)insertWithModel:(PersonModel *)model
{
    db = [self openDB];
    NSString *sql = [NSString stringWithFormat:@"insert into perpleTable(number, name, gender, age) values('%ld', '%@', '%@', '%ld')", model.number, model.name, model.gender, model.age];
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"添加成功");
    } else {
        NSLog(@"添加失败");
    }
    [self closeDB];
}

- (void)delateWithAge:(NSInteger)age
{
    db = [self openDB];
    NSString *sql = [NSString stringWithFormat:@"delete from perpleTable where age = '%ld'", age];
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除表失败");
    }
    [self closeDB];
}

- (void)delateWithName:(NSString *)name
{
    db = [self openDB];
    NSString *sql = [NSString stringWithFormat:@"delete from perpleTable where name = '%@'", name];
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除表失败");
    }
    [self closeDB];
}

- (void)updateWithName:(NSString *)name byAge:(NSInteger)age
{
    db = [self openDB];
    NSString *sql = [NSString stringWithFormat:@"update perpleTable set name = '%@' where age = '%ld'", name, age];
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"更新数据成功");
    } else {
        NSLog(@"更新数据失败");
    }
    [self closeDB];
}

- (void)selertAll
{
    //1.打开数据库
    db = [self openDB];
    //2.写sql语句
    NSString *sql = @"select * from perpleTable";
    //3.创建跟随指针
    sqlite3_stmt *stmt = nil;
    //4.执行语句
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL);
    //5.判断语句是否正确
    if (result == SQLITE_OK) {
        NSLog(@"查询成功");
        //6.执行查询
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //7.满足条件 读取数据
            int number = sqlite3_column_int(stmt, 0);
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            const unsigned char *gender = sqlite3_column_text(stmt, 2);
            int age = sqlite3_column_int(stmt, 3);
            NSLog(@"name = %s, number = %d, gender = %s, age = %d", name, number, gender, age);
        }
        
    } else {
        NSLog(@"查询失败");
    }
    //8.释放指针
    sqlite3_finalize(stmt);
    //9.关闭数据库
    [self closeDB];
}

- (void)selertWithAge:(NSInteger)age
{
    db = [self openDB];
    NSString *sql = [NSString stringWithFormat:@"select * from perpleTable where age = %ld", age];
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"查询成功");
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            const unsigned char *gender = sqlite3_column_text(stmt, 2);
            int number = sqlite3_column_int(stmt, 0);
            int age = sqlite3_column_int(stmt, 3);
            NSLog(@"name = %s, number = %d, gender = %s, age = %d", name, number, gender, age);
        }
        
    } else {
        NSLog(@"查询失败");
    }
    sqlite3_finalize(stmt);
    [self closeDB];
}


@end
