//
//  ViewController.m
//  EOCDate
//
//  Created by ksw on 2017/9/29.
//  Copyright © 2017年 SunYong. All rights reserved.
//

#import "ViewController.h"
#import "DateCell.h"
#import "EOCDateModel.h"
#import "EOCTestCollectViewCtr.h"


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{
    
    NSMutableArray *_dayAry;
    
    NSInteger _selectYear;
    NSInteger _selectMonth;
    NSInteger _selectDay;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _dayAry = [NSMutableArray array];
    
    //注册cellxib
    [_collectionView registerNib:[UINib nibWithNibName:@"DateCell" bundle:nil] forCellWithReuseIdentifier:@"DateCell"];
    //  [_collectionView registerClass:nil forCellWithReuseIdentifier:@""];
    
    //注册头视图xib
    //头视图要使用类:UICollectionReusableView
    [_collectionView registerNib:[UINib nibWithNibName:@"DateHeadView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DateHeadView"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //iteme的设置也可以使用UICollectionViewDelegateFlowLayout的代理,如下注释
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing =0;
    flowLayout.itemSize = CGSizeMake(ScreenWidth/7, ScreenWidth/7); // cell的大小
    flowLayout.headerReferenceSize = CGSizeMake(ScreenWidth, ScreenWidth/7);
    [_collectionView setCollectionViewLayout:flowLayout];
    
    //数据处理
    [self dataHandle:[[NSDate date] description]];
    
}

- (void)dataHandle:(NSString*)dateStr{
    [_dayAry removeAllObjects];
    
    NSInteger firstWeekDay = [EOCDateModel weekDayMonthOfFirstDayFromDate:[NSDate date]];
    NSInteger dayCount = [EOCDateModel totalDaysInMonthFromDate:[NSDate date]];
    
    // 补前面空白
    for (int i = 0; i< firstWeekDay; i++) {
        [_dayAry addObject:@""];
    }
    
    for (int i = 0; i< dayCount; i++) {
        [_dayAry addObject:@(i+1)];
    }
    
    // 补后面空白
    int leftDay = 0;
    if (_dayAry.count%7) { //等于0不补,不然会多出一行空白
        leftDay = 7 - _dayAry.count%7;
    }
    for (int i = 0; i< leftDay; i++) {
        [_dayAry addObject:@""];
    }
    
    [_collectionView reloadData];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.navigationController pushViewController:[EOCTestCollectViewCtr new] animated:YES];
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    return CGSizeMake(ScreenWidth/7, ScreenWidth/7);
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//
//    return 0;
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//
//    return 0;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dayAry.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DateCell" forIndexPath:indexPath];
    cell.textLabel.text = [_dayAry[indexPath.row] description];
    return cell;
}

//头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DateHeadView" forIndexPath:indexPath];
        
        return headView;
    }
    return nil;
}

@end
