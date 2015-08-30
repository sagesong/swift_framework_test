//
//  PopCollectionViewCell.swift
//  padashiDemo
//
//  Created by JackSong on 15/8/30.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit

class PopCollectionViewCell: UICollectionViewCell {
    var lable : UILabel?
    var block : ((one : Int) -> Void)?
    override init(frame: CGRect)
    {
        super.init(frame : frame)
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.yellowColor()
        
        lable = UILabel()
        lable?.backgroundColor = UIColor.blueColor()
        self.addSubview(lable!)
        lable!.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
        block = {
            (one : Int ) in
            print("\(one)")
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
        let animation = layoutAttributes as! AnimationAttributes
        self.layer.addAnimation(animation.animation, forKey: "transform")
    }
}
