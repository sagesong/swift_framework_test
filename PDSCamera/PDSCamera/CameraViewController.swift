//
//  CameraViewController.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit

@objc
public class CameraViewController: UIViewController {
    
    override public func loadView() {
        self.view = CameraView()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brownColor()
        
        var overlayView = CameraOverlayView()
        self.view.addSubview(overlayView)
//        overlayView.frame = self.view.frame
        overlayView.backgroundColor = UIColor.blackColor()
        overlayView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
