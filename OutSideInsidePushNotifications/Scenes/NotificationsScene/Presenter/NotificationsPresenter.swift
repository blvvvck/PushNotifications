//
//  NotificationsPresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationsPresenter {
    
    /// Set up Notifications view
    func viewIsReady()
    
    /// Function to set up view when it did appear
    func viewDidAppear()
}
