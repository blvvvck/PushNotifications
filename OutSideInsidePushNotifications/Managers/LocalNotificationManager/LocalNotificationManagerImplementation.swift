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

    init() {
        notifView = UIView()
        dbManager = DBManagerImplemetation()
    }
    
    func showNotification(_ window: inout UIWindow, and userInfo: [AnyHashable : Any]) {
        
        handleNotification(with: userInfo)
        
        currentWindow = window
        
        setUpNotificationView()
        
        presentAnimation()
        
        dismissAnimation()
    }
    
    func setUpNotificationView() {
        notifView = UIView(frame: CGRect(x: self.pushViewXPosition, y: self.pushViewYPositionAfterDismiss, width: self.pushViewWidth, height: pushViewHeight))
        let myView = NotificationView()
        guard let currentNotification = dbManager.getLastNotification() else { return }
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
            self.notifView.layer.cornerRadius = self.notifViewCornerRadius
            self.notifView.layer.shadowColor = UIColor.black.cgColor
            self.notifView.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.notifView.layer.shadowOpacity = self.notifViewShadowOpacity
            self.notifView.layer.shadowRadius = self.notifViewShadowRadius
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
    
    func handleNotification(with userInfo: [AnyHashable : Any]) {
        
        do {
            let data = try JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted)
            let parseModel = try JSONDecoder().decode(ParseNotificationModel.self, from: data)
            
            if let currentBody = parseModel.aps.alert.body, let currentImageUrl = parseModel.data.attachmentUrl {
                let model = NotificationModel(value: ["imageUrl": "\(currentImageUrl)", "title": "\(parseModel.aps.alert.title)", "body": "\(currentBody)" ])
                
                dbManager.addData(object: model)
            } else if let currentBody = parseModel.aps.alert.body {
                let model = NotificationModel(value: ["imageUrl": "", "title": "\(parseModel.aps.alert.title)", "body": "\(currentBody)" ])
                dbManager.addData(object: model)
            } else if let currentImageUrl = parseModel.data.attachmentUrl {
                let model = NotificationModel(value: ["imageUrl": "\(currentImageUrl)", "title": "\(parseModel.aps.alert.title)", "body": "" ])
                dbManager.addData(object: model)
            } else {
                let model = NotificationModel(value: ["imageUrl": "", "title": "\(parseModel.aps.alert.title)", "body": "" ])
                dbManager.addData(object: model)
            }
            
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
}
