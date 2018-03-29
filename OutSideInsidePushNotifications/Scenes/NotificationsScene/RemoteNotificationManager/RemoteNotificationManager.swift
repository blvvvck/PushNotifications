//
//  RemoteNotificationManager.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol RemoteNotificationManager {
    
    
    /// Handling notification and save into db
    ///
    /// - Parameter userInfo: notification's json
    func handleNotification(with userInfo: [AnyHashable : Any])
    
    /// Register notifications with some options
    func registerForPushNotifications()
    
    /// Check notifications configuration (authorized or not authorized)
    func getPushNotificationsConfigurations()
}
