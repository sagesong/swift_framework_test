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
    var radius:CGFloat = 60
    var cellCount:Int?
    var modlesArray:[AnyObject]?
    
    override func prepareLayout() {
        super.prepareLayout()
        let size : CGSize? = self.collectionView?.frame.size
        cellCount = self.collectionView?.numberOfItemsInSection(0)
        center = CGPointMake(size!.width / 2, size!.height / 2)
        
    }
    
    override func collectionViewContentSize() -> CGSize {
        
        return self.collectionView!.frame.size
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        var attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        if let modles = modlesArray {
            var string : String = modles[indexPath.item] as! String
            let size = string.sizeWithAttributes([NSFontAttributeName : UIFont.systemFontOfSize(18)])
            let wider = size.width > size.height ? size.width : size.height
            attributes.size = CGSizeMake(wider, wider)
        }
//        attributes.size = CGSizeMake(30, 30)
        let distance = cos(Double(indexPath.item)*M_PI * 2 / Double(cellCount!)) * Double(radius + CGFloat( arc4random_uniform(30)) + attributes.size.width * 0.5)
        let y = sin(Double(indexPath.item)*M_PI * 2 / Double(cellCount!)) * Double(radius + CGFloat( arc4random_uniform(30)) + attributes.size.width * 0.5)
        attributes.center = CGPointMake(center!.x + CGFloat(distance) , center!.y + CGFloat(y))
        return attributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attrs = [UICollectionViewLayoutAttributes]()
        for i in 0..<cellCount!
        {
            var indexPath = NSIndexPath(forItem: i , inSection: 0)
            let attri = self.layoutAttributesForItemAtIndexPath(indexPath)
            attrs.append(attri)
        }
        return attrs
    }
    
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        return nil;
    }
}
