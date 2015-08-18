//
//  CameraViewController.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import AVFoundation
@objc
public class CameraViewController: UIViewController,CameraTopViewDelagate {
    
    lazy var captureSessionManager:CameraManage = {
        var manager = CameraManage()
//        manager.setupCaptureSession()
        return manager
    }()
    
    override public func loadView() {
        self.view = CameraView()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        var overlayView = CameraOverlayView()
        self.view.addSubview(overlayView)
//        overlayView.frame = self.view.frame
        overlayView.backgroundColor = UIColor.clearColor()
        overlayView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        overlayView.topView.delegate = self
        let captureLayer : AVCaptureVideoPreviewLayer = self.view.layer as! AVCaptureVideoPreviewLayer
        captureLayer.session = captureSessionManager.captureSession
        captureSessionManager.flashEnable = true
        
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        captureSessionManager.captureSession.startRunning()
        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    
    public override func shouldAutorotate() -> Bool {
//        print("\(self.view.frame)")
        return true
    }
    
    // CameraTopViewDelegate
    func backBtnClicked() {
        print("back")
        self.dismissViewControllerAnimated(true, completion: nil)
        captureSessionManager.captureSession.startRunning()
    }
    
    func flashBtnClicked() {
        print("flash")
        captureSessionManager.flashEnable = !captureSessionManager.flashEnable
    }
    
    func microBtnClicked() {
        print("micro")
        captureSessionManager.takeSnap()
    }
    
    func switchBtnClicked() {
        print("switch")
        captureSessionManager.switchCamera()
    }
}
