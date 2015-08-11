//
//  CameraTopView.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit

enum cameraTopButtonType{
    case back
    case flash
    case micro
    case switchCamera
}

class CameraTopView: UIView {
    // constants
    let btnNum = 4
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        var i = 0
        for i in 1..<self.btnNum
        {
            var btn = UIButton()
            self.addSubview(btn)
            btn.tag = i
            
        }
    }
    
    override func updateConstraints() {
        let btnH = self.frame.size.height
        let btnW = self.frame.size.width / CGFloat(self.btnNum)
        
        
    }
    

}
