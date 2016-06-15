//
//  ProfileUIView.swift
//  ShareMoments
//
//  Created by Jun Dang on 2016-06-10.
//  Copyright © 2016 Jun Dang. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class ProfileUIView: UIView {
    static var HEIGHT: CGFloat {get {return 90} }
    private var didSetupConstraints = false
    var profileImageView = UIImageView()
    var informationView = UIView()
    var nameLbl = UILabel()
    var timeElapsedLbl = UILabel()
    var likeImageView = UIImageView()
    var countsOfLikeLbl = UILabel()
    var commentImageView = UIImageView()
    var numberOfCommentsLbl = UILabel()
    var viewForButtons = UIView()
    var likeButton = UIButton()
    var shareButton = UIButton()
    var starButton = UIButton()
    var viewForTags = UIView()
    var tagLbl = UILabel()
    var tags = [UILabel]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setStyle()
        render()
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
private extension ProfileUIView {
    func setup() {
        addSubview(profileImageView)
        informationView.addSubview(nameLbl)
        informationView.addSubview(timeElapsedLbl)
        informationView.addSubview(likeImageView)
        informationView.addSubview(countsOfLikeLbl)
        informationView.addSubview(commentImageView)
        informationView.addSubview(numberOfCommentsLbl)
        addSubview(informationView)
        viewForButtons.addSubview(likeButton)
        viewForButtons.addSubview(shareButton)
        viewForButtons.addSubview(starButton)
        addSubview(viewForButtons)
        viewForTags.addSubview(tagLbl)
        tagLbl.text = "Tags:"
        let texts = ["OOR", "One Ok Rock", "Rock", "Japanese", "Concert", "Cooking", "French"]
        var tagTexts = [String]()
        if texts.count > 5 {
            for i in 0..<5 {
                let text = texts[i]
                tagTexts.append(text)
            }
            tagTexts.append("...")
        } else {
            tagTexts = texts
        }
        for tagText in tagTexts {
            let tag = UILabel()
            tag.text = tagText
            tags.append(tag)
        }
        for tag in tags {
            viewForTags.addSubview(tag)
        }
        addSubview(viewForTags)
    }
}
//MARK: layout
private extension ProfileUIView {
    func layoutView() {
        constrain(self) {
            $0.height == ProfileUIView.HEIGHT
        }
        constrain(profileImageView) {
            $0.left == $0.superview!.left + 3
            $0.top == $0.superview!.top + 3
            $0.width == 60
            $0.height == 60
        }
        constrain(informationView, profileImageView) {
            $0.left == $1.right + 5
            $0.top == $1.top
            $0.bottom == $1.bottom
        }
        constrain(viewForButtons, informationView) {
            $0.left == $1.right
            $0.top == $1.top
            $0.bottom == $1.bottom
            $0.right == $0.superview!.right - 3
        }
        constrain(viewForTags, informationView) {
            $0.top == $1.bottom + 10
            $0.bottom == $0.superview!.bottom
            $0.left == $0.superview!.left + 3
            $0.right == $0.superview!.right - 3
        }
        constrain(nameLbl) {
            $0.left == $0.superview!.left
            $0.top == $0.superview!.top + 1
        }
        constrain(timeElapsedLbl, nameLbl) {
            $0.left == $1.left
            $0.top == $1.bottom
            $0.right == $1.right
        }
        constrain(likeImageView, timeElapsedLbl) {
            $0.left == $0.superview!.left
            $0.top == $1.bottom + 5
            $0.width == 20
            $0.height == 20
        }
        constrain(countsOfLikeLbl, likeImageView) {
            $0.left == $1.right
            $0.top == $1.top
            $0.bottom == $1.bottom
        }
        constrain(commentImageView, countsOfLikeLbl) {
            $0.left == $1.right + 6
            $0.top == $1.top
            $0.width == 20
            $0.bottom == $1.bottom
        }
        constrain(numberOfCommentsLbl, commentImageView) {
            $0.left == $1.right
            $0.top == $1.top
            $0.bottom == $1.bottom
        }
        constrain(starButton) {
            $0.right == $0.superview!.right - 5
            $0.top == $0.superview!.top + 3
            $0.height == 30
            $0.width == 30
         }
        constrain(shareButton, starButton) {
            $0.right == $1.left - 2
            $0.top == $1.top
            $0.width == 30
            $0.bottom == $1.bottom
        }
        constrain(likeButton, shareButton) {
            $0.right == $1.left - 2
            $0.top == $1.top
            $0.width == 30
            $0.bottom == $1.bottom
        }
        constrain(likeButton) {
            $0.left == $0.superview!.left + 3
        }
        constrain(tagLbl) {
            $0.left == $0.superview!.left + 6
            $0.bottom == $0.superview!.bottom - 2
            $0.top == $0.superview!.top + 2
        }
        constrain(tagLbl) {
            $0.left == $0.superview!.left + 6
            $0.bottom == $0.superview!.bottom - 2
            $0.top == $0.superview!.top + 2
        }
        if tags.count > 0 {
            constrain(tags[0], tagLbl) {
                $0.left == $1.right + 5
                $0.top == $1.top
                $0.bottom == $1.bottom
            }
            for index in 1..<tags.count {
                constrain(tags[index], tags[index - 1]) {
                    $0.left == $1.right + 5
                    $0.top == $1.top
                    $0.bottom == $1.bottom
                }
            }			
        }
    }
}
//MARK: setStyle
private extension ProfileUIView {
    func setStyle() {
        profileImageView.backgroundColor = UIColor.greenColor()
        profileImageView.layer.cornerRadius = 60/2
        profileImageView.layer.masksToBounds = false
        profileImageView.clipsToBounds = true
        self.profileImageView.clipsToBounds = true
        nameLbl.font = UIFont.latoFontOfSize(12)
        nameLbl.textAlignment = .Left
        nameLbl.sizeToFit()
        nameLbl.numberOfLines = 0
        timeElapsedLbl.font = UIFont.latoFontOfSize(10)
        timeElapsedLbl.textAlignment = .Left
        timeElapsedLbl.numberOfLines = 0
        timeElapsedLbl.sizeToFit()
        countsOfLikeLbl.font = UIFont.latoFontOfSize(10)
        countsOfLikeLbl.textAlignment = .Left
        countsOfLikeLbl.numberOfLines = 0
        countsOfLikeLbl.sizeToFit()
        numberOfCommentsLbl.font = UIFont.latoFontOfSize(10)
        numberOfCommentsLbl.textAlignment = .Left
        numberOfCommentsLbl.numberOfLines = 0
        numberOfCommentsLbl.sizeToFit()
        tagLbl.font = UIFont.latoFontOfSize(10)
        tagLbl.textAlignment = .Left
        tagLbl.numberOfLines = 0
        tagLbl.sizeToFit()
        for tag in tags {
            tag.font = UIFont.latoFontOfSize(10)
            tag.textAlignment = .Left
            tag.numberOfLines = 0
            tag.sizeToFit()
            tag.textColor = UIColor(red: (155/255.0), green: (0/255.0), blue: (0/255.0), alpha: 1.0)
        }
    }
}
//Render
extension ProfileUIView {
    func render() {
        profileImageView.image = UIImage(named: "huojianhua3")
        nameLbl.text = "@Steven Takatsu"
        timeElapsedLbl.text = "14 min ago"
        countsOfLikeLbl.text = "63"
        numberOfCommentsLbl.text = "41"
        likeButton.setImage(UIImage(named:"like"), forState: .Normal)
        shareButton.setImage(UIImage(named:"share"), forState: .Normal)
        starButton.setImage(UIImage(named:"star"), forState: .Normal)
        likeImageView.image = UIImage(named: "likeCounts")
        commentImageView.image = UIImage(named: "commentCounts")
   }
}



    
   




