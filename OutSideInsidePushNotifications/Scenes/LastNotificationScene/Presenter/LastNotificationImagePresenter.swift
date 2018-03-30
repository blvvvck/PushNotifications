//
//  LastNotificationImagePresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class LastNotificationImagePresenter: LastNotificationImagePresenterProtocol, ImageManagerDelegate, RemoteNotificationManagerDelegate {

    var view: LastNotificationImageViewControllerProtocol!
    var imageManager: ImageManagerProtocol!
    var dbManager: DBManager!
    
    //MARK: - LastNotificationImagePresenterProtocol
    
    func updateImage(with model: NotificationModel) {
        if let imgUrlString = model.imageUrl {
            if let imageUrl = URL(string: imgUrlString) {
                imageManager.getImageFromUrl(imageURL: imageUrl)
            } else {
                view.setPlaceholder()
            }
        }
        else {
            view.setPlaceholder()
        }
    }
    
    func viewIsReady() {
        view.setPlaceholder()
    }
    
    func getLastNotification() {
        let notification = dbManager.getLastNotification()
        guard let currentNotification = notification else { return }
        updateImage(with: currentNotification)
    }
    
    //MARK: - ImageManagerDelegate
    
    func getNotificationImage(image: ImageModel) {
        view.setLastNotificationImage(image: image.image)
    }
    
    //MARK: - RemoteNotificationManagerDelegate
    
    func getLastNotification(with notification: NotificationModel) {
        updateImage(with: notification)
    }
        
}
