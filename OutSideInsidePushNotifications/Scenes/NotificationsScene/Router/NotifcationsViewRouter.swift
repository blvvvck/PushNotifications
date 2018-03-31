//
//  NotifcationsViewRouter.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 31/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationsViewRouter: ViewRouter {
        
    /// Present notification's detail screen
    ///
    /// - Parameter row: notification's number in array of all notifications
    func presentDetailNotification(for row: Int)
    
}
