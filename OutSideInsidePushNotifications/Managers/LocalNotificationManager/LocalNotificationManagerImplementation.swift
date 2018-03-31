//
//  LocalNotificationManagerImplementation.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 01/04/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

class LocalNotificationManagerImplementation: LocalNotificationManager {
   
    var notifView: UIView!
    var currentWindow: UIWindow!
    var dbManager: DBManager!
    lazy var notificaton = { self.dbManager.getLastNotification() }()
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

    init() {
        notifView = UIView()
        dbManager = DBManagerImplemetation()
    }
    
    func showNotification(_ window: inout UIWindow) {
        currentWindow = window
        
        setUpNotificationView()
        
        presentAnimation()
        
        dismissAnimation()
    }
    
    func setUpNotificationView() {
        notifView = UIView(frame: CGRect(x: self.pushViewXPosition, y: self.pushViewYPositionAfterDismiss, width: self.pushViewWidth, height: pushViewHeight))
        let myView = NotificationView()
        guard let currentNotification = notificaton else { return }
        if let imgUrlString = currentNotification.imageUrl, let imageUrl = URL(string: imgUrlString) {
            myView.notificationImage.sd_setImage(with: imageUrl, completed: nil)
            myView.notificationBodyLabel.text = currentNotification.body
            myView.notificationTitle.text = currentNotification.title
            notifView.addSubview(myView)
            currentWindow.addSubview(notifView)
        } else {
            myView.setUpNotification(title: "\(currentNotification.title)", body: "\(currentNotification.body)", image: UIImage(named: "Placeholder")!)
            notifView.addSubview(myView)
            currentWindow.addSubview(notifView)
        }
    }
    
    func presentAnimation() {
        UIView.animate(withDuration: animateDuration, delay: animateDelay, usingSpringWithDamping: animateSpringWithDamping, initialSpringVelocity: animateSpringVelocity, options: .curveEaseIn, animations: {() -> Void in
            self.notifView.frame = CGRect(x: self.pushViewXPosition, y: self.pushViewYPosition, width: self.pushViewWidth, height: self.pushViewHeight )
            self.notifView.backgroundColor = UIColor.white
            self.notifView.layer.cornerRadius = 10
            self.notifView.layer.shadowColor = UIColor.black.cgColor
            self.notifView.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.notifView.layer.shadowOpacity = 0.4
            self.notifView.layer.shadowRadius = 2.0
        }, completion: {(_ finished: Bool) -> Void in
        })
    }
    
    func dismissAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {             UIView.animate(withDuration: self.animateDuration, delay: self.animateDelay, usingSpringWithDamping: self.animateSpringWithDamping, initialSpringVelocity: self.animateSpringVelocity, options: .curveEaseIn, animations: {() -> Void in
                self.notifView.frame = CGRect(x: self.pushViewXPosition, y: self.pushViewYPositionAfterDismiss, width: self.pushViewWidth, height: self.pushViewHeightAfterDismiss)
            }, completion: {(_ finished: Bool) -> Void in
            })
        }
    }
}
