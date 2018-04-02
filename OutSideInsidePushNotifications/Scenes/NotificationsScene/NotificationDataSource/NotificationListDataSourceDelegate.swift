//
//  NotificationListDataSourceDelegate.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 01/04/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol NotificationListDataSourceDelegate {
    
    /// Function for heandle the tapped cell
    ///
    /// - Parameter row: row number
    func didTapOnCell(with row: Int)
    
}
