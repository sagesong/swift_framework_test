//
//  ViewLayout.swift
//  padashiDemo
//
//  Created by JackSong on 15/8/25.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit

class ViewLayout: UICollectionViewLayout {
    var center:CGPoint?
    var radius:CGFloat?
    var cellCount:Int8?
    
    
    override func prepareLayout() {
        
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeZero
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        return nil
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        return nil
    }
    
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return nil;
    }
}
