//
//  EOCTestCollectViewCtr.m
//  EOCDate
//
//  Created by sy on 2017/9/29.
//  Copyright © 2017年 SunYong. All rights reserved.
//

#import "EOCTestCollectViewCtr.h"
#import "DateCell.h"
#import "EOCCollectionLayout.h"

@interface EOCTestCollectViewCtr (){
    
    NSMutableArray *_colorAry;
}

@end

@implementation EOCTestCollectViewCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    _colorAry = [NSMutableArray array];
    [_colorAry addObject:[UIColor whiteColor]];
    [_colorAry addObject:[UIColor blackColor]];
    [_colorAry addObject:[UIColor blueColor]];
    [_colorAry addObject:[UIColor redColor]];
    [_colorAry addObject:[UIColor yellowColor]];
    [_colorAry addObject:[UIColor orangeColor]];
    [_colorAry addObject:[UIColor purpleColor]];
   
    
    [_collectionView registerNib:[UINib nibWithNibName:@"DateCell" bundle:nil] forCellWithReuseIdentifier:@"DateCell"];
    
    [_collectionView setCollectionViewLayout:[EOCCollectionLayout new]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 80;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DateCell" forIndexPath:indexPath];
    cell.textLabel.text = [@(indexPath.row) description];
    cell.backgroundColor = [_colorAry objectAtIndex:indexPath.row%_colorAry.count];
    return cell;
}

@end
