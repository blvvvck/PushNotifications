//
//  DetailNotificationViewControllerProtocol.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol DetailNotificationViewControllerProtocol {
    
    /// Setter for notification header
    ///
    /// - Parameter text: header
    func setNotificationHeader(text: String)
    
    /// Setter for notification image
    ///
    /// - Parameter image: ImageModel with notification image
    func setNotificationImage(image: ImageModel)
    
    /// Setter for notification message
    ///
    /// - Parameter text: message
    func setNotificationMessage(text: String)
    
    /// Function for hiding notification image, if it is nil
    func hideNotificationImage()
    
}
