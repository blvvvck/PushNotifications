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
    
    func prepareView(with model: NotificationModel) {
        
        view.setNotificationHeader(text: model.title)
        view.setNotificationMessage(text: model.body)
        if let imgUrlString = model.imageUrl, let imageUrl = URL(string: imgUrlString) {
                imageManager.getImageFromUrl(imageURL: imageUrl)
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
