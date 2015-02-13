//
//  CardLayout.m
//
//
//  Created by Kumar Aditya 
//  Copyright (c) 2014 Kumar Aditya. All rights reserved.
//

#import "CardLayout.h"

@implementation CardLayout

#pragma mark - Required Methods

- (CGSize)collectionViewContentSize
{
    return self.collectionView.bounds.size;
}

-(void)prepareLayout
{
    //Initialization Methods
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    
    NSArray *visibleIndexPaths = [self indexPathsOfItemsInRect:rect];
    
    for (NSIndexPath *indexPath in visibleIndexPaths)
    {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [layoutAttributes addObject:attributes];
    }
    
    return layoutAttributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}


#pragma mark - Layout Attribute Provider

- (UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    [self applyLayoutAttributes:layoutAttributes];
    
    return layoutAttributes;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)attributes
{
    attributes.frame = [self frameForIndexPath:attributes.indexPath withOffset:attributes.indexPath.row andHeight:self.actualCellHeight];
    
    attributes.zIndex =  - attributes.indexPath.row;
}

#pragma mark - Calculate Frame for each Cell

- (CGRect) frameForIndexPath:(NSIndexPath *)indexPath withOffset:(NSUInteger) offset andHeight:(CGFloat) height
{
    CGRect rect = CGRectMake( self.startX + self.cardsXOffset * offset / 2, self.startY +  self.cardsYOffset * ([self.collectionView numberOfItemsInSection:0] - indexPath.row) , self.actualCellWidth - self.cardsXOffset * offset , height);
    
    return rect;
}


#pragma mark - Helper Methods

- (NSArray *)indexPathsOfItemsInRect:(CGRect) rect
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    NSUInteger sections = [self.collectionView numberOfSections];
    
    for (NSUInteger section = 0; section < sections; section++)
    {
        for (NSInteger row = 0; row < [self.collectionView numberOfItemsInSection:section]; row++)
        {
            [indexPaths addObject:[NSIndexPath indexPathForItem:row inSection:section]];
        }
    }
    
    return indexPaths;
}
@end
