//
//  PopViewController.swift
//  padashiDemo
//
//  Created by JackSong on 15/8/30.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit

class PopViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var collection : UICollectionView?
    var modles : Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let layout = CustomViewLayout()
        collection = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collection?.center = self.view.center
        collection?.bounds = CGRectMake(0, 0, self.view.bounds.width, 300)
        collection?.backgroundColor = UIColor.blueColor()
        collection?.dataSource = self
        collection?.delegate = self
        self.view.addSubview(collection!)
        modles = [String]()
//        modles = ["goood","jjjjjj"]
        // Do any additional setup after loading the view.
        collection?.registerClass(PopCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return modles!.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell : PopCollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? PopCollectionViewCell ?? PopCollectionViewCell(frame: CGRectZero)
        cell!.lable?.text = modles![indexPath.row]
        return cell!
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        modles = ["handsome","good","jjjjj","iiiii"]
//        collection?.reloadData()
        var array = [NSIndexPath]()
        for i in 0..<self.modles!.count{
            let indexPath = NSIndexPath(forItem: i , inSection: 0)
            array.append(indexPath)
        }
        
        
        collection?.performBatchUpdates({ () -> Void in
//            for i in 0..<self.modles!.count{
            
//                let indexPath = NSIndexPath(forItem: i, inSection: 0)
                self.collection?.insertItemsAtIndexPaths(array)

//            }
        }, completion: { (completion) -> Void in
            
        })

    }
}
