//
//  ShareMomentsViewController.swift
//  ShareMoments
//
//  Created by Jun Dang on 2016-06-10.
//  Copyright © 2016 Jun Dang. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class ShareMomentsViewController: UIViewController {
    var commentsArray: [String] = []
    private let profileUIView = ProfileUIView(frame: CGRectZero)
    private let headerPhotoView = HeaderPhotoView(frame: CGRectZero)
    private var tableView = UITableView(frame: CGRectZero)
    private var leaveCommentButton = UIButton(frame: CGRectZero)
    var maskView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layoutView()
        setStyle()
        render()
        tapOnthePicture()
        setupNavigationbar()
        
        
        commentsArray = ["The Comments box lets people comment on content on your site using their Facebook profile and shows this activity to their friends in news feed", "good one"]
       
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }

extension ShareMomentsViewController {
    func setup() {
        view.addSubview(profileUIView)
        view.addSubview(headerPhotoView)
        setupTableView()
        view.addSubview(leaveCommentButton)
    }
}

extension ShareMomentsViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        tableView.frame = CGRectMake(6, 350, self.view.frame.width - 12, self.view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.registerClass(CommentsTableViewCell.self, forCellReuseIdentifier: "CommentsTableViewCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .None
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentsArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommentsTableViewCell", forIndexPath: indexPath) as! CommentsTableViewCell
        cell.commentsLbl.text = commentsArray[indexPath.row]
        cell.profileImageView.image = UIImage(named: "huojianhua3")
        cell.timeElapseLbl.text = "2 min ago"
        cell.nameLbl.text = "@huojianhua"
        return cell
        
    }

}
extension ShareMomentsViewController {
    func layoutView() {
        constrain(headerPhotoView) {
            $0.top == $0.superview!.top - 20
            $0.width == $0.superview!.width
            $0.centerX == $0.superview!.centerX
        }
        constrain(profileUIView, headerPhotoView) {
            $0.top == $1.bottom
            $0.width == $0.superview!.width
            $0.centerX == $0.superview!.centerX
        }
        constrain(leaveCommentButton, tableView) {
            $0.bottom == $1.top - 30
            $0.centerX == $0.superview!.centerX
            $0.height == 25
            $0.left == $0.superview!.left + 100
            $0.right == $0.superview!.right - 100
        }
    }
}

extension ShareMomentsViewController {
    func setStyle() {
        leaveCommentButton.layer.backgroundColor = UIColor(red: (155/255.0), green: (0/255.0), blue: (0/255.0), alpha: 1.0).CGColor
        leaveCommentButton.layer.borderColor = UIColor(red: (155/255.0), green: (0/255.0), blue: (0/255.0), alpha: 1.0).CGColor
        leaveCommentButton.layer.borderWidth = 1.5
        leaveCommentButton.layer.cornerRadius = 10
        leaveCommentButton.titleLabel!.font = UIFont.latoLightFontOfSize(14)
    }
}

extension ShareMomentsViewController {
    func render() {
        leaveCommentButton.setTitle("Leave a Comment", forState: .Normal)
    }
}

extension ShareMomentsViewController {
    func tapOnthePicture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(ShareMomentsViewController.imageTapped(_:)))
        headerPhotoView.photoImageView.userInteractionEnabled = true
        headerPhotoView.photoImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    func imageTapped(img: AnyObject)
    {
        maskView = UIView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height))
        maskView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        let closeButton = UIButton(frame: CGRectMake(view.frame.width - 25, 5, 20, 20))
        closeButton.setImage(UIImage(named: "close"), forState: .Normal)
        closeButton.addTarget(self, action: #selector(ShareMomentsViewController.closeButtonPressed(_:)), forControlEvents: .TouchUpInside)
        maskView.addSubview(closeButton)
        view.addSubview(maskView)
    }
    func closeButtonPressed(sender: UIButton) {
        maskView.removeFromSuperview()
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
//MARK: add navigation bar
extension ShareMomentsViewController: UINavigationControllerDelegate, UINavigationBarDelegate {
    func setupNavigationbar() {
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 40))
        navigationBar.backgroundColor = UIColor(red: (224/255.0), green: (224/255.0), blue: (224/255.0), alpha: 0.5)
        navigationBar.tintColor = UIColor.whiteColor()
        navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationBar.shadowImage = UIImage()
        navigationBar.delegate = self
        let navigationItem = UINavigationItem()
        let returnButton = UIButton(frame: CGRectMake(0, 0, 30, 30))
        returnButton.setImage(UIImage(named: "backArrow"), forState: .Normal)
        //assign button to navigationbar
        let returnButtonItem = UIBarButtonItem(customView: returnButton)
        navigationItem.leftBarButtonItem = returnButtonItem
        navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor()]
        let locationButton = UIButton(frame: CGRectMake(0, 0, 30, 30))
        locationButton.setImage(UIImage(named:"location"), forState: .Normal)
        //assign button to navigationbar
        let locationButtonItem = UIBarButtonItem(customView: locationButton)
        navigationItem.rightBarButtonItem = locationButtonItem
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
   }
}
