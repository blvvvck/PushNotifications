//
//  DetailNotificationPresenterProtocol.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DetailNotificationPresenterProtocol {
    
    /// Function for prepare detail notification view
    ///
    /// - Parameter model: struct NotificationModel
    func prepareView(with model: NotificationModel2)
    
}
