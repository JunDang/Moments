//
//  CommentsTableViewCell.swift
//  ShareMoments
//
//  Created by Jun Dang on 2016-06-10.
//  Copyright © 2016 Jun Dang. All rights reserved.
//

import UIKit
import LatoFont
import Cartography

class CommentsTableViewCell: UITableViewCell {
    var profileImageView = UIImageView()
    var nameLbl = UILabel()
    var commentsLbl = UILabel()
    var timeElapseLbl = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        setup()
        setStyle()
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: Setup
extension CommentsTableViewCell {
    func setup() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(commentsLbl)
        contentView.addSubview(nameLbl)
        contentView.addSubview(timeElapseLbl)
    }
}
//MARK: layout
extension CommentsTableViewCell {
    func layoutView() {
        constrain(profileImageView) {
            $0.left == $0.superview!.left
            $0.top == $0.superview!.top + 10
            $0.width == 30
            $0.height == 30
        }
        constrain(nameLbl, profileImageView) {
            $0.left == $1.right + 5
            $0.top == $0.superview!.top + 10
        }
        constrain(timeElapseLbl, nameLbl) {
            $0.top == $1.top
            $0.right == $0.superview!.right - 5
        }
        constrain(commentsLbl, nameLbl) {
            $0.top == $1.bottom + 2
            $0.left == $1.left
            $0.right == $0.superview!.right - 5
            $0.bottom == $0.superview!.bottom
        }
    }
}

//MARK: Set Style
extension CommentsTableViewCell {
    func setStyle() {
        profileImageView.backgroundColor = UIColor.greenColor()
        profileImageView.layer.cornerRadius = 30/2
        profileImageView.layer.masksToBounds = false
        profileImageView.clipsToBounds = true
        nameLbl.font = UIFont.latoFontOfSize(12)
        nameLbl.textAlignment = .Left
        nameLbl.sizeToFit()
        commentsLbl.font = UIFont.latoFontOfSize(12)
        commentsLbl.textAlignment = .Left
        commentsLbl.numberOfLines = 0
        commentsLbl.sizeToFit()
        commentsLbl.lineBreakMode = NSLineBreakMode.ByWordWrapping
        timeElapseLbl.font = UIFont.latoFontOfSize(12)
        timeElapseLbl.textAlignment = .Left
        timeElapseLbl.sizeToFit()
    }
}


