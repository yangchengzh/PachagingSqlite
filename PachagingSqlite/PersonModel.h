//
//  PersonModel.h
//  PachagingSqlite
//
//  Created by 蓝云 on 2017/5/23.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject

@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *gender;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,assign) NSInteger number;

@end
