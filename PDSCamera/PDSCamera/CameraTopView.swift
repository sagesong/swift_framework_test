//
//  CameraTopView.swift
//  PDSCamera
//
//  Created by Lightning on 15/8/11.
//  Copyright (c) 2015年 Lightning. All rights reserved.
//

import UIKit
import SnapKit
enum cameraTopButtonType : Int{
    case back = 1
    case flash
    case micro
    case switchCamera
}

protocol CameraTopViewDelagate {
    func backBtnClicked()
    func flashBtnClicked()
    func microBtnClicked()
    func switchBtnClicked()
}

class CameraTopView: UIView {
    // constants
    let btnNum = 4
    var delegate : CameraTopViewDelagate?
    var closures : (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        var i = 0
        for i in 1...self.btnNum
        {
            var btn = UIButton()
            self.addSubview(btn)
            btn.tag = i
            btn.addTarget(self, action: "topViewBtnClicked:", forControlEvents: .TouchUpInside)
            btn.backgroundColor = UIColor.grayColor()
            btn.alpha = 0.2
        }
        let back = self.subviews[0] as! UIButton
        back.setTitle("后退", forState: .Normal)
        let flash = self.subviews[1] as! UIButton
        flash.setTitle("闪光", forState: .Normal)
        let micro = self.subviews[2] as! UIButton
        micro.setTitle("静音", forState: .Normal)
        let swit = self.subviews[3] as! UIButton
        swit.setTitle("转换", forState: .Normal)
    }
    
    func topViewBtnClicked(btn : UIButton) -> Void{
         print("\(cameraTopButtonType.back)")
        print("\(cameraTopButtonType.flash)")
//        let btnType : cameraTopButtonType.RawValue = btn.tag
        let btnType : cameraTopButtonType = cameraTopButtonType(rawValue: btn.tag)!
        
        switch btnType {
        case .back :
            delegate?.backBtnClicked()
        case .flash :
            delegate?.flashBtnClicked()
        case .micro :
            delegate?.microBtnClicked()
        case .switchCamera :
            delegate?.switchBtnClicked()
        default :
            print("default")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let btnH = self.frame.size.height
        let btnW = self.frame.size.width / CGFloat(self.btnNum)
        
        var btn: UIButton = self.subviews[0] as! UIButton
//        btn.backgroundColor = UIColor.redColor()
        
        var btn1: UIButton = self.subviews[1] as! UIButton
//        btn1.backgroundColor = UIColor.blueColor()
        
        var btn2: UIButton = self.subviews[2] as! UIButton
//        btn2.backgroundColor = UIColor.orangeColor()
        
        var btn3: UIButton = self.subviews[3] as! UIButton
//        btn3.backgroundColor = UIColor.redColor()
        
        btn.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(btn1)
            make.height.equalTo(self)
            make.leading.equalTo(self)
            make.right.equalTo(btn1.snp_left)
        }
        
        btn1.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(btn2)
            make.height.equalTo(self)
            make.right.equalTo(btn2.snp_left)
        }
        
        btn2.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(btn3)
            make.height.equalTo(self)
            make.right.equalTo(btn3.snp_left)
            
        }
        
        btn3.snp_makeConstraints { (make) -> Void in
//            make.width.equalTo(btn)
            make.height.equalTo(self)
            make.right.equalTo(self)
        }
    }
    
//    override func updateConstraints() {
//        
//        
//        super.updateConstraints()
//    }
    
}
