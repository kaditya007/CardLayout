//
//  CardLayout.h
//
//
//  Created by Kumar Aditya 
//  Copyright (c) 2014 Kumar Aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardLayout : UICollectionViewLayout

@property (nonatomic, readwrite) float visibleCellHeight;
@property (nonatomic, readwrite) float actualCellHeight;
@property (nonatomic, readwrite) float actualCellWidth;
@property (nonatomic, readwrite) float startX;
@property (nonatomic, readwrite) float startY;
@property (nonatomic, readwrite) float cardsXOffset;
@property (nonatomic, readwrite) float cardsYOffset;

@end
