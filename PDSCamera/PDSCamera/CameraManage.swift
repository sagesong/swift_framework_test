//
//  CameraManage.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import AVFoundation

@objc
public class CameraManage: NSObject {
    var captureSession : AVCaptureSession?
    
    
    
    public func setupCaptureSession(){
        captureSession = AVCaptureSession()
        if (captureSession?.canSetSessionPreset(AVCaptureSessionPreset1280x720) != nil)
        {
            captureSession?.sessionPreset = AVCaptureSessionPreset1280x720
        }
    }
}
