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
    
    @IBOutlet weak var notificationBody: UITextView!

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
    
    func setUpNotification(title: String, body: String, image: UIImage) {
        notificationTitle.text = title
        notificationBodyLabel.text = body
        notificationImage.image = image
    }
    
    @IBAction func notificationTapped(_ sender: Any) {
        print("Tapped!")
    }
    
    func presentAnimation(_ notifView: inout UIView) {
        self.notifView = notifView
        UIView.animate(withDuration: animateDuration, delay: animateDelay, usingSpringWithDamping: animateSpringWithDamping, initialSpringVelocity: animateSpringVelocity, options: .curveEaseIn, animations: {() -> Void in
            self.notifView.frame = CGRect(x: self.pushViewXPosition, y: self.pushViewYPosition, width: self.pushViewWidth, height: self.pushViewHeight )
            self.notifView.backgroundColor = UIColor.white
            self.notifView.layer.cornerRadius = self.notifViewCornerRadius
            self.notifView.layer.shadowColor = UIColor.black.cgColor
            self.notifView.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.notifView.layer.shadowOpacity = self.notifViewShadowOpacity
            self.notifView.layer.shadowRadius = self.notifViewShadowRadius
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            self.notifView.addGestureRecognizer(tap)
            self.notifView.isUserInteractionEnabled = true
            
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(_:)))
            swipe.direction = .up
            self.notifView.addGestureRecognizer(swipe)
            self.notifView.isUserInteractionEnabled = true
            
        }, completion: {(_ finished: Bool) -> Void in
        })
    }
    
    func dismissAnimation(_ notifView: UIView, and timeToDismiss: DispatchTimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + timeToDismiss) {             UIView.animate(withDuration: self.animateDuration, delay: self.animateDelay, usingSpringWithDamping: self.animateSpringWithDamping, initialSpringVelocity: self.animateSpringVelocity, options: .curveEaseIn, animations: {() -> Void in
            notifView.frame = CGRect(x: self.pushViewXPosition, y: self.pushViewYPositionAfterDismiss, width: self.pushViewWidth, height: self.pushViewHeightAfterDismiss)
        }, completion: {(_ finished: Bool) -> Void in
        })
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Hello World")
    }
    
    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        dismissAnimation(notifView, and: timeToDismissByUser)
    }
    
}
