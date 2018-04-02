//
//  LocalNotificationManager.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 01/04/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol LocalNotificationManager {
    
    /// Show notification on screen
    ///
    /// - Parameter window: 
    func showNotification(_ window: inout UIWindow, and userInfo: [AnyHashable: Any])
    
    /// This method sets up notification view
    func setUpNotificationView()
}
