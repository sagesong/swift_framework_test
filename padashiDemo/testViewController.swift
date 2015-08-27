//
//  testViewController.swift
//  padashiDemo
//
//  Created by JackSong on 15/8/25.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import SnapKit

class testViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var collection : UICollectionView?
    var modles : Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var layout : ViewLayout = ViewLayout()
        layout.modlesArray = modles
        collection = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collection?.dataSource = self
        collection?.delegate = self
        collection?.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(collection!)
        collection!.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        self.view.backgroundColor = UIColor.purpleColor()
        var circle = UIView()
        collection!.addSubview(circle)
        circle.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        circle.backgroundColor = UIColor.redColor()
        circle.layer.cornerRadius = 50;
        circle.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        collection?.registerClass(CollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        modles = ["handsome","good","big","sb","jijiji","帅哥"]
    }

    func setupCollectionView()
    {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return modles!.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell : CollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? CollectionViewCell ?? CollectionViewCell(frame: CGRectZero)
        cell!.lable?.text = modles![indexPath.row]
        return cell!
    }
 

}
