//
//  NotificationsView.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationsView: class {
    
    /// Reload table view
    func refreshNotificationsView()
    
    /// Function to set up notifications view
    func setUpView()
    
    /// Function to set row number
    ///
    /// - Parameter number: number of row
    func setRow(number: Int)
    
}
