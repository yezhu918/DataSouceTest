//
//  ViewController.m
//  DataSouceTest
//
//  Created by mac03 on 16/1/18.
//  Copyright © 2016年 SY. All rights reserved.
//

#import "ViewController.h"
#import "TabDelegate.h"
#import "CustomCell.h"

static NSString * const indentifier = @"indentifier";

@interface ViewController ()

@property(strong , nonatomic) TabDelegate * tabDelegate;
@property(strong , nonatomic) UITableView * table;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString * str1 = @"张三";
    NSString * str2 = @"李四";
    NSArray * arr1 = @[str1,str2];
    NSArray * arr2 = @[@"王五",@"马六"];
    NSMutableArray  * dataSource = [NSMutableArray array];
    NSInteger i = 0;
    while (i<10) {
        if (i%2) {
            [dataSource addObject:arr1];
        }else{
            [dataSource addObject:arr2];
        }
        i++;
    }
    
    self.table = [UITableView new];
    self.table.frame = self.view.bounds;
    [self.view addSubview:self.table];

// system cell
    
    self.tabDelegate = [[TabDelegate alloc] initWithItems:dataSource indentifier:indentifier configerCell:^(id cell, id item) {
        UITableViewCell * sCell = cell;
        sCell.textLabel.text = item;
    }];

    
// custom cell
    
    self.tabDelegate = [[TabDelegate alloc] initWithItems:dataSource configerCell:^UITableViewCell *(NSIndexPath *indexPath, NSArray *items) {
        
        CustomCell * cell = [self.table dequeueReusableCellWithIdentifier:indentifier];
        if (!cell) {
            cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        }
        [cell setCellWithData:items[indexPath.section][indexPath.row]];
        return cell;
        
    }];
    
    self.tabDelegate.isManyGroup = YES;
    self.tabDelegate.heightForRowAtIndexPath =^CGFloat(NSIndexPath *indexPath){ return 120;};
    self.tabDelegate.heightForHeaderInSection =^CGFloat(NSInteger section){ return 20;};
    self.tabDelegate.viewForHeaderInSection = ^UIView * (NSInteger section){
        UILabel * lbl = [UILabel new];
        lbl.text = @"   组头";
        lbl.font = [UIFont systemFontOfSize:11];
        return lbl;
    };
    self.tabDelegate.didSelectRowAtIndexPath = ^(NSIndexPath *indexPath,NSArray * items){
        NSLog(@"%@",items[indexPath.row]);
    };
   
   
    self.table.dataSource = self.tabDelegate;
    self.table.delegate = self.tabDelegate;

}


@end
