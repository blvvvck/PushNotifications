//
//  LastNotificationImageViewControllerProtocol.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol LastNotificationImageViewControllerProtocol {
    
    /// Function to setting last notification image
    ///
    /// - Parameter image: last notification image
    func setLastNotificationImage(image: UIImage)
    
    /// Function for setting placeholder, if last notification image is nil
    func setPlaceholder()
    
}
