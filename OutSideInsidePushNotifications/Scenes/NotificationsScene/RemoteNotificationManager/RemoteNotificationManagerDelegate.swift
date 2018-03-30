//
//  RemoteNotificationManagerDelegate.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 30/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol RemoteNotificationManagerDelegate {
    
    
    /// Function for getting last notification
    ///
    /// - Parameter notification: struct notificationModel
    func getLastNotification(with notification: NotificationModel)
}
