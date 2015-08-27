//
//  CollectionViewCell.swift
//  padashiDemo
//
//  Created by Lightning on 15/8/25.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var lable : UILabel?
    var block : ((one : Int) -> Void)?
    override init(frame: CGRect)
     {
        super.init(frame : frame)
        self.layer.cornerRadius = self.frame.size.width / 2
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
}
