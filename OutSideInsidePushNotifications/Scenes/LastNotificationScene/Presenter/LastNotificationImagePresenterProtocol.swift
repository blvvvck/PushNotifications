//
//  LastNotificationImagePresenterProtocol.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol LastNotificationImagePresenterProtocol {
    
    /// Function for updating last notification image
    ///
    /// - Parameter model: struct NotificationModel
    func updateImage(with model: NotificationModel)
    
    /// Function for set up LastNotificationViewController
    func viewIsReady()
}
