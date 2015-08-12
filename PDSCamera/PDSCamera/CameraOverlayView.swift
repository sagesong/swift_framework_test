//
//  CameraOverlayView.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
class CameraOverlayView: UIView {
    lazy var topView : CameraTopView = {
        var top = CameraTopView()
        return top
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.topView)
//        self.setNeedsUpdateConstraints()
//        self.updateConstraintsIfNeeded()
//        self.updateConstraints()
//        self.layoutIfNeeded()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.topView.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(64)
        }
        super.updateConstraints()

    }

}
