//
//  AnimationAttributes.swift
//  padashiDemo
//
//  Created by JackSong on 15/8/30.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit

class AnimationAttributes: UICollectionViewLayoutAttributes {
    var animation: CABasicAnimation?
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let customsAttr : AnimationAttributes = super.copyWithZone(zone) as! AnimationAttributes
        customsAttr.animation = animation
        return customsAttr
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if self === object {
            return true
        }
        
        if object == nil || object?.isKindOfClass(AnimationAttributes.classForCoder()) == false{
            return false
        }
        
        let someobject = object as? AnimationAttributes
        if someobject?.animation?.isEqual(self) == false
        {
            return false
        }
        return true
    }
    
    
}
