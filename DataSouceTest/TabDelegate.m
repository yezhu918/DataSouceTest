//
//  DataSource.m
//  DataSouceTest
//
//  Created by mac03 on 16/1/18.
//  Copyright © 2016年 SY. All rights reserved.
//

#import "TabDelegate.h"

static CGFloat const kRowHeight = 44.0f;
static CGFloat const kHeaderHeight = 0.001f;
static CGFloat const kFooterHeight = 0.001f;

@interface TabDelegate()
@property(strong , nonatomic) NSArray * items;
@property(strong , nonatomic) NSString * indentifier;
@property(assign , nonatomic) BOOL isCustomCell;

@end

@implementation TabDelegate

- (instancetype)initWithItems:(NSArray *)items  configerCell:(UITableViewCell *(^)(NSIndexPath * indexPath ,NSArray * items))configerCell{
    
    if (self = [super init]) {
        self.items = items;
        self.configerCell = configerCell;
        self.isCustomCell = YES;
    }
    return self;
}

- (instancetype)initWithItems:(NSArray *)items indentifier:(NSString *)indentifier configerCell:(void(^)(id cell ,id  item))configerCell{
    
    if (self = [super init]) {
        self.items = items;
        self.indentifier = indentifier;
        self.configerSystemCell = configerCell;
        self.isCustomCell = NO;
    }
    return self;
    
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isManyGroup) {
         return self.items[(NSUInteger) indexPath.section][indexPath.row];
    }else{
      return self.items[(NSUInteger) indexPath.row];
    }
   
}


#pragma mark UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.isManyGroup) {
        return self.items.count;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.isManyGroup) {
        NSArray * subItems = self.items[section];
        return subItems.count;
    }else{
        return self.items.count;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isCustomCell) {
        if(self.configerCell)
        return self.configerCell(indexPath,self.items);
        return nil;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.indentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.indentifier];
        }

        if (self.configerSystemCell)
            self.configerSystemCell(cell, [self itemAtIndexPath:indexPath]);
        return cell;

    }
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.heightForRowAtIndexPath)
    return self.heightForRowAtIndexPath(indexPath);
    return kRowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.heightForHeaderInSection)
    return self.heightForHeaderInSection(section);
    return kHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.heightForFooterInSection)
    return self.heightForFooterInSection(section);
    return kFooterHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectRowAtIndexPath)
    self.didSelectRowAtIndexPath(indexPath,self.items);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.viewForFooterInSection)
    return  self.viewForFooterInSection(section);
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.viewForHeaderInSection)
    return  self.viewForHeaderInSection(section);
    return nil;
}

@end
