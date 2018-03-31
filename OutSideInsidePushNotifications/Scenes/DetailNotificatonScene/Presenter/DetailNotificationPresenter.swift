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
    var notificaton: NotificationModel!
    var dbManager: DBManager!
    
    //MARK: - DetailNotificationPresenterProtocol
    
    func prepareView(with row: Int) {
        notificaton = dbManager.getNotification(from: row)
        
        view.setNotificationHeader(text: notificaton.title)
        view.setNotificationMessage(text: notificaton.body)
        if let imgUrlString = notificaton.imageUrl, let imageUrl = URL(string: imgUrlString) {
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
