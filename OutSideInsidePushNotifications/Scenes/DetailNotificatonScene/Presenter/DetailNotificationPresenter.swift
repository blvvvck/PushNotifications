//
//  DetailNotificationPresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationPresenter: DetailNotificationPresenterProtocol, ImageManagerDelegate {
    
    var view: DetailNotificationViewControllerProtocol!
    var imageManager: ImageManagerProtocol!
    
    //MARK: - DetailNotificationPresenterProtocol
    
    func prepareView(with model: NotificationModel2) {
        
        view.setNotificationHeader(text: model.header)
        view.setNotificationMessage(text: model.message)
        if let imgURL = model.imageURL {
            imageManager.getImageFromUrl(imageURL: imgURL)
        }
        else {
            view.hideNotificationImage()
        }
                
    }
    
    //MARK: - ImageManagerDelegate
    
    func getNotificationImage(image: ImageModel) {
        view.setNotificationImage(image: image.image)
    }
    
}
