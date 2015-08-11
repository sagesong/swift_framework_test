//
//  CameraView.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import AVFoundation

@objc
public class CameraView: UIView {
    
    public override class func layerClass() -> AnyClass{
        return AVCaptureVideoPreviewLayer.classForCoder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        AVCaptureVideoPreviewLayer(layer: self.layer).videoGravity = AVLayerVideoGravityResizeAspectFill
        
    }
    
    convenience init(){
        self.init(frame : CGRectZero)
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        AVCaptureVideoPreviewLayer(layer: self.layer).videoGravity = AVLayerVideoGravityResizeAspectFill
    }
    

}
