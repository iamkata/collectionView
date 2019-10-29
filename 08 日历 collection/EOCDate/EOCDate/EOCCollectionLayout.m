//
//  EOCCollectionLayout.m
//  EOCDate
//
//  Created by sy on 2017/9/29.
//  Copyright © 2017年 SunYong. All rights reserved.
//

#import "EOCCollectionLayout.h"

@implementation EOCCollectionLayout{
    
    NSMutableArray *_layoutAttriAry;
    NSMutableArray *_originYAry;
    NSInteger _collectViewRowCount;
    
    
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _layoutAttriAry = [NSMutableArray new];
        _originYAry = [NSMutableArray new];
        _collectViewRowCount = 3;
    }
    return self;
}

//准备数据 对每一个cell的布局进行初始化
- (void)prepareLayout{
    
    [_layoutAttriAry removeAllObjects];
    [_originYAry removeAllObjects];
    for (int i = 0; i < _collectViewRowCount; i++) {
        [_originYAry addObject:@(0)];
    }
    // row
    
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < cellCount; i++) {
        // 初始化每一个cell的布局属性
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *atributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [_layoutAttriAry addObject:atributes];
    }
    
}

// 拿到每个item的属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    float cellSizeWidth = [UIScreen mainScreen].bounds.size.width/_collectViewRowCount;
    
    // 如果这个cell是一个图片内容，那么就返回图片高度
    float cellSizeHeight = 50 + arc4random_uniform(100); // 通过indexPath 算出cell相应高度
    
    float cellX = cellSizeWidth*(indexPath.row%_collectViewRowCount);
    
    float cellY = [_originYAry[indexPath.row%3] floatValue];
    _originYAry[indexPath.row%_collectViewRowCount] = @(cellY + cellSizeHeight);
    
    attributes.frame = CGRectMake(cellX, cellY, cellSizeWidth, cellSizeHeight);
    
    return attributes;
    
}

// tableview 所有的高度计算，就算出了contentsize
- (CGSize)collectionViewContentSize{
    float maxHeight = [_originYAry[0] floatValue];
    for (int i = 1; i < _collectViewRowCount; i++) {
        if (maxHeight < [_originYAry[i] floatValue]) {
            maxHeight = [_originYAry[i] floatValue];
        }
    }
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, maxHeight);
    return size;
}


- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _layoutAttriAry;
}

@end
