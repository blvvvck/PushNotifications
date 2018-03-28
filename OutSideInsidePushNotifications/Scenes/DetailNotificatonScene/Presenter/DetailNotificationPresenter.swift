//
//  DetailNotificationPresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationPresenter: DetailNotificationPresenterProtocol {
    
    var view: DetailNotificationViewControllerProtocol!
    
    //MARK: - DetailNotificationPresenterProtocol
    
    func prepareView(header: String, image: ImageModel?, message: String) {
        
        view.setNotificationHeader(text: header)
        view.setNotificationMessage(text: message)

        if let notificationImage = image {
            view.setNotificationImage(image: notificationImage)
        } else {
            view.hideNotificationImage()
        }
        
    }
}
