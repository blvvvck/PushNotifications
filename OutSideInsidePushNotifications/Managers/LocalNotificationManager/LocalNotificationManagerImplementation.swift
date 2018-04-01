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
   
    var notifView: UIView = UIView()
    var currentWindow: UIWindow!
    var dbManager: DBManager!
    let pushViewXPosition = 10
    let pushViewWidth = 300
    let pushViewHeight = 110
    let pushViewYPositionAfterDismiss = -170
    let remoteNotificationsManager: RemoteNotificationManager!
    let timeToDismiss: DispatchTimeInterval = .seconds(5)

    
    init() {
        dbManager = DBManagerImplemetation()
        remoteNotificationsManager = RemoteNotificationManagerImplementation()
    }
    
    func showNotification(_ window: inout UIWindow, and userInfo: [AnyHashable : Any]) {
        
        remoteNotificationsManager.handleNotification(with: userInfo)
        
        currentWindow = window
        
        setUpNotificationView()
        
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
            myView.presentAnimation(&notifView)
            myView.dismissAnimation(notifView, and: timeToDismiss)
            
        } else {
            myView.setUpNotification(title: "\(currentNotification.title)", body: "\(currentNotification.body)", image: UIImage(named: "Placeholder")!)
            notifView.addSubview(myView)
            currentWindow.addSubview(notifView)
            myView.presentAnimation(&notifView)
            myView.dismissAnimation(notifView, and: timeToDismiss)
        }
    }
}
