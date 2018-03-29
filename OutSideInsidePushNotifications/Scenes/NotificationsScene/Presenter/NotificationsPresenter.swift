//
//  NotificationsPresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationsPresenter {
    
    /// Number of notifications
    var numberOfNotifications: Int { get }
    
    /// Get data from DB and give it to NotificationLisDataSource
    func viewDidLoad()
}
