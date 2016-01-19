//
//  CustomCell.m
//  DataSouceTest
//
//  Created by mac03 on 16/1/18.
//  Copyright © 2016年 SY. All rights reserved.
//

#import "CustomCell.h"
#import <objc/runtime.h>

@implementation CustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel * lbl1 = [UILabel new];
        [self.contentView addSubview:lbl1];
        
        UILabel * lbl2 = [UILabel new];
        [self.contentView addSubview:lbl2];
        
        UILabel * lbl3 = [UILabel new];
        [self.contentView addSubview:lbl3];
        
        objc_setAssociatedObject(self, @"lbl1", lbl1, OBJC_ASSOCIATION_ASSIGN);
        objc_setAssociatedObject(self, @"lbl2", lbl2, OBJC_ASSOCIATION_ASSIGN);
        objc_setAssociatedObject(self, @"lbl3", lbl3, OBJC_ASSOCIATION_ASSIGN);

    }
    return self;
}

- (void)setCellWithData:(NSString *)str{
    
    UILabel * lab1 = objc_getAssociatedObject(self, @"lbl1");
    UILabel * lab2 = objc_getAssociatedObject(self, @"lbl2");
    UILabel * lab3 = objc_getAssociatedObject(self, @"lbl3");
    
    lab1.text =str;
    lab2.text =@"哈哈";
    lab3.text =@"呵呵";
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    UILabel * lab1 = objc_getAssociatedObject(self, @"lbl1");
    UILabel * lab2 = objc_getAssociatedObject(self, @"lbl2");
    UILabel * lab3 = objc_getAssociatedObject(self, @"lbl3");
    
    lab1.frame = CGRectMake(15, 0, 300, 40);
    lab2.frame = CGRectMake(15, 40, 300, 40);
    lab3.frame = CGRectMake(15, 80, 300, 40);
    
}
@end
