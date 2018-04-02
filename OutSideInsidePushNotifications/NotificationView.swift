//
//  NotificationView.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 31/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationView: UIView {
        
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var notificationImage: UIImageView!
    
    @IBOutlet weak var notificationTitle: UILabel!
    
    @IBOutlet weak var notificationBodyLabel: UILabel!
    
    let pushViewXPosition = 10
    let pushViewYPosition = 10
    let pushViewWidth = 300
    let pushViewHeight = 110
    let pushViewYPositionAfterDismiss = -170
    let pushViewHeightAfterDismiss = 60
    let animateDuration = 1.0
    let animateDelay = 0.1
    let animateSpringWithDamping: CGFloat = 0.5
    let animateSpringVelocity: CGFloat = 0.1
    let notifViewCornerRadius: CGFloat = 10
    let notifViewShadowOpacity: Float = 0.4
    let notifViewShadowRadius: CGFloat = 2.0
    let viewNibName = "NotificationView"
    var notifView = UIView()
    let timeToDismissByUser: DispatchTimeInterval = .seconds(0)
    let timeToDismiss: DispatchTimeInterval = .seconds(5)
    var currentWindow = UIWindow()
    let rowOfFirstElementInNotificationsArray = 0
    let secondTabBarIndex = 1
    let detailNotificationViewControllerIdentifier = "DetailNotificationViewController"
    let mainStoryboardName = "Main"

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed(viewNibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = notifViewShadowRadius
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowOpacity = notifViewShadowOpacity
        contentView.layer.shadowRadius = notifViewShadowRadius
    }
    
    func setUpNotification(with model: NotificationModel) {
        notificationTitle.text = model.title
        notificationBodyLabel.text = model.body
        if let imgUrlString = model.imageUrl, let imageUrl = URL(string: imgUrlString) {
            notificationImage.sd_setImage(with: imageUrl, completed: nil)
        } else {
            notificationImage.image = UIImage(named: "Placeholder")!
        }
    }
    
    func presentAnimation(_ notifView: inout UIView, _ window: inout UIWindow) {
        self.notifView = notifView
        self.currentWindow = window
        UIView.animate(withDuration: animateDuration, delay: animateDelay, usingSpringWithDamping: animateSpringWithDamping, initialSpringVelocity: animateSpringVelocity, options: .curveEaseIn, animations: { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.notifView.frame = CGRect(x: strongSelf.pushViewXPosition, y: strongSelf.pushViewYPosition, width: strongSelf.pushViewWidth, height: strongSelf.pushViewHeight )
            strongSelf.notifView.backgroundColor = UIColor.white
            strongSelf.notifView.layer.cornerRadius = strongSelf.notifViewCornerRadius
            strongSelf.notifView.layer.shadowColor = UIColor.black.cgColor
            strongSelf.notifView.layer.shadowOffset = CGSize(width: 3, height: 3)
            strongSelf.notifView.layer.shadowOpacity = strongSelf.notifViewShadowOpacity
            strongSelf.notifView.layer.shadowRadius = strongSelf.notifViewShadowRadius
            
            strongSelf.dismissAnimation(strongSelf.notifView, and: strongSelf.timeToDismiss)
            
            strongSelf.registerTap()
            strongSelf.registerSwipe()
            
        }, completion: {(_ finished: Bool) -> Void in
        })
    }
    
    func dismissAnimation(_ notifView: UIView, and timeToDismiss: DispatchTimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeToDismiss) { UIView.animate(withDuration: self.animateDuration, delay: self.animateDelay, usingSpringWithDamping: self.animateSpringWithDamping, initialSpringVelocity: self.animateSpringVelocity, options: .curveEaseIn, animations: { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            notifView.frame = CGRect(x: strongSelf.pushViewXPosition, y: strongSelf.pushViewYPositionAfterDismiss, width: strongSelf.pushViewWidth, height: strongSelf.pushViewHeightAfterDismiss)
        }, completion: {(_ finished: Bool) -> Void in
        })
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: mainStoryboardName, bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: detailNotificationViewControllerIdentifier) as! DetailNotificationViewController
        detailVC.row = rowOfFirstElementInNotificationsArray
        guard let root = currentWindow.rootViewController as? UITabBarController else { return }
        root.selectedIndex = secondTabBarIndex
        guard let navigation = root.childViewControllers.last as? UINavigationController else { return }
        navigation.pushViewController(detailVC, animated: true)
        dismissAnimation(self.notifView, and: timeToDismissByUser)
    }
    
    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        dismissAnimation(notifView, and: timeToDismissByUser)
    }
    
    func registerTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.notifView.addGestureRecognizer(tap)
        self.notifView.isUserInteractionEnabled = true
    }
    
    func registerSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(_:)))
        swipe.direction = .up
        self.notifView.addGestureRecognizer(swipe)
        self.notifView.isUserInteractionEnabled = true
    }
    
}
