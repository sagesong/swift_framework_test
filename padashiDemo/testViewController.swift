//
//  testViewController.swift
//  padashiDemo
//
//  Created by JackSong on 15/8/25.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import SnapKit

class testViewController: UIViewController {
    var collection : UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var layout : ViewLayout = ViewLayout()
//        collection = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        self.view.backgroundColor = UIColor.purpleColor()
        var circle = UIView()
        self.view.addSubview(circle)
        circle.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        circle.backgroundColor = UIColor.redColor()
        circle.layer.cornerRadius = 50;
        circle.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
