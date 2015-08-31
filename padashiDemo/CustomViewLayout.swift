//
//  CustomViewLayout.swift
//  padashiDemo
//
//  Created by JackSong on 15/8/30.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit

class CustomViewLayout: UICollectionViewLayout {
    var cellCount : Int?
    var controller : UIViewController?
    override func prepareLayout() {
        super.prepareLayout()
        cellCount = self.collectionView!.numberOfItemsInSection(0)
    }
    
    override func collectionViewContentSize() -> CGSize {
        
        return self.collectionView!.frame.size
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        var attributes = AnimationAttributes(forCellWithIndexPath: indexPath)
        
        attributes.size = CGSizeMake(80, 30)
        attributes.center = CGPoint(x: 40, y: CGFloat(30 * (indexPath.item % 5 + 1)))
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
//        let attr : AnimationAttributes = super.initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath) as! AnimationAttributes
        let attr = layoutAttributesForItemAtIndexPath(itemIndexPath) as! AnimationAttributes
        attr.size = CGSizeMake(80, 30)
        attr.center = CGPoint(x: self.collectionView!.frame.size.width + CGFloat(-100), y: CGFloat(30 * (itemIndexPath.item % 5 + 1)))
        let animation = CABasicAnimation(keyPath: "transform")
//        attr.animation?.keyPath = "transform"
//        animation?.duration = Double(itemIndexPath.item % 5 + 3)
        animation?.duration = Double(arc4random_uniform(3)+2)

        animation?.removedOnCompletion = false
        animation?.fillMode = kCAFillModeForwards
        animation?.fromValue = NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0))
        animation?.toValue = NSValue(CATransform3D: CATransform3DMakeTranslation(-self.collectionView!.frame.size.width - 80, 0, 0))
        attr.animation = animation
        animation.delegate = controller!
        return attr;
    }
    
    override class func layoutAttributesClass() -> AnyClass {
        return AnimationAttributes.self
    }
}
