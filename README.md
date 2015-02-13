# CardLayout
An iOS collection view card layout representation.

To integrate this you need to do following steps.

1. Download the Layout fies.
2. In your nib file or by code set layout property of collectionview to CardLayout.
3. Add the method in your collection viwe implementation class

-(void)setLayout
{
    
    CardLayout *layout =  (CardLayout *)collectionViewObj.collectionViewLayout;
    
    layout.actualCellHeight = yourValue;//500
    
    layout.visibleCellHeight = yourValue;//15;
    
    layout.actualCellWidth = yourValue;//320;
    
    layout.startX = yourValue;//0;
    
    layout.startY = yourValue;//0;
    
    layout.cardsXOffset = yourValue;//12;
    
    layout.cardsYOffset = yourValue;//8;
} 

