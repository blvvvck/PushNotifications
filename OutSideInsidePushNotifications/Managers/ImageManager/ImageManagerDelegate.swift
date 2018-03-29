//
//  ImageManagerDelegate.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol ImageManagerDelegate {
    
    /// Function for getting notification image
    ///
    /// - Parameter image: struct ImageModel with UIImage in it
    func getNotificationImage(image: ImageModel)
    
}
