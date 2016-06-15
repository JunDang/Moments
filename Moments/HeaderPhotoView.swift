//
//  HeaderPhotoView.swift
//  ShareMoments
//
//  Created by Jun Dang on 2016-06-10.
//  Copyright © 2016 Jun Dang. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class HeaderPhotoView: UIView {
    static var HEIGHT: CGFloat {get {return 200} }
    private var didSetupConstraints = false
    var photoImageView = UIImageView()
    var messageLbl = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        render()
        setStyle()
    }
    
    required init(coder aDecoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if didSetupConstraints {
            super.updateConstraints()
            return
        }
        layoutView()
        super.updateConstraints()
        didSetupConstraints = true
    }
    
}

//MARK: Setup
private extension HeaderPhotoView {
    func setup() {
        addSubview(photoImageView)
        addSubview(messageLbl)
        backgroundColor = UIColor.yellowColor()
    }
}
//MARK: layout
private extension HeaderPhotoView {
    func layoutView() {
        constrain(self) {
            $0.height == HeaderPhotoView.HEIGHT
        }
        constrain(photoImageView) {
            $0.edges == $0.superview!.edges
        }
        constrain(messageLbl) {
            $0.left == $0.superview!.left + 3
            $0.right == $0.superview!.right - 3
            $0.bottom == $0.superview!.bottom - 3
        }
    }
}
//MARK: setStyle
private extension HeaderPhotoView {
    func setStyle() {
        messageLbl.font = UIFont.latoFontOfSize(12)
        messageLbl.textAlignment = .Left
        messageLbl.lineBreakMode = NSLineBreakMode.ByWordWrapping
        messageLbl.numberOfLines = 0
        messageLbl.sizeToFit()
        messageLbl.textColor = UIColor.whiteColor()
    }
}
//Render
extension HeaderPhotoView {
    func render() {
        photoImageView.image = UIImage(named: "huojianhua200")
        messageLbl.text = "空山新雨后，天气晚来秋。明月松间照，清泉石上流。竹喧归浣女，莲动下渔舟。随意春芳歇，王孙自可留。"
    }
}
    


