//
//  ImageManagerProtocol.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol ImageManagerProtocol {
    
    /// Function for downloading notification image from URL
    ///
    /// - Parameter imageURL: image URL
    func getImageFromUrl(imageURL: URL)
    
}
