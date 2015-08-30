//
//  ViewController.swift
//  padashiDemo
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var startBtn : UIButton = {
        var cameraBtn = UIButton()
        cameraBtn.backgroundColor = UIColor.redColor()
        cameraBtn.frame = CGRectMake(0, 0, 200, 60)
        cameraBtn.center = self.view.center
        cameraBtn.setTitle("Launch Camera", forState: .Normal)
        cameraBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        cameraBtn.layer.cornerRadius = 5.0
        cameraBtn.layer.masksToBounds = true
        cameraBtn.addTarget(self, action:"cameraClick", forControlEvents: .TouchUpInside)
        return cameraBtn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(startBtn)
        self.setupConstrains()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cameraClick()
    {
        print("camera btn clicked")
//        var cameraController = CameraViewController()
//        self.presentViewController(cameraController, animated: true, completion: nil)
        var test = PopViewController()
        self.presentViewController(test, animated: true, completion: nil)
    }
    
    func setupConstrains()
    {
        startBtn.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(60)
            make.left.equalTo(self.view).offset(60)
            make.right.equalTo(self.view).offset(-60)
            make.center.equalTo(self.view)
        }
    }

}

