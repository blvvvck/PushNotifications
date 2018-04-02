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
    
    /// Open detail notification screen
    ///
    /// - Parameter window: current scrren in app
    func openDetailNotificationAfterTap(with window: inout UIWindow)
}
