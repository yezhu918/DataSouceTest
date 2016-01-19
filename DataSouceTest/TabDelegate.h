//
//  DataSource.h
//  DataSouceTest
//
//  Created by mac03 on 16/1/18.
//  Copyright © 2016年 SY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TabDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>

@property(assign,nonatomic) BOOL isManyGroup;
@property(copy  ,nonatomic) CGFloat(^heightForRowAtIndexPath)(NSIndexPath *indexPath);
@property(copy  ,nonatomic) CGFloat(^heightForHeaderInSection)(NSInteger section);
@property(copy  ,nonatomic) CGFloat(^heightForFooterInSection)(NSInteger section);
@property(copy  ,nonatomic) UIView *(^viewForFooterInSection)(NSInteger section);
@property(copy  ,nonatomic) UIView *(^viewForHeaderInSection)(NSInteger section);
@property(copy  ,nonatomic) void(^didSelectRowAtIndexPath)(NSIndexPath *indexPath,NSArray * items);
@property(copy , nonatomic) UITableViewCell *(^configerCell)(NSIndexPath * indexPath, NSArray * items);
@property(copy , nonatomic) void(^configerSystemCell)(id cell, id  item);

- (instancetype)initWithItems:(NSArray *)items configerCell:(UITableViewCell *(^)(NSIndexPath * indexPath ,NSArray * items))configerCell;

- (instancetype)initWithItems:(NSArray *)items indentifier:(NSString *)indentifier configerCell:(void(^)(id cell ,id  item))configerCell;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;


@end
