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
    var router: DetailNotificationRouter!
    
    //MARK: - DetailNotificationPresenterProtocol
    
    func prepareView(with row: Int) {
        notificaton = dbManager.getNotification(from: row)
        self.view.setNotificationHeader(text: self.notificaton.title)
        self.view.setNotificationMessage(text: self.notificaton.body)
        if let imgUrlString = self.notificaton.imageUrl, let imageUrl = URL(string: imgUrlString) {
            self.imageManager.getImageFromUrl(imageURL: imageUrl)
        }
        else {
            self.view.hideNotificationImage()
        }
    }
    
    func didSwiped() {
        router.presentNotificationsTable()
    }
    
    //MARK: - ImageManagerDelegate
    
    func getNotificationImage(image: ImageModel) {
        view.setNotificationImage(image: image.image)
    }
    
}
