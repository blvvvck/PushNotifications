//
//  LastNotificationImagePresenter.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class LastNotificationImagePresenter: LastNotificationImagePresenterProtocol, ImageManagerDelegate {
    
    var view: LastNotificationImageViewControllerProtocol!
    var imageManager: ImageManagerProtocol!
    
    //MARK: - LastNotificationImagePresenterProtocol
    
    func updateImage(with model: NotificationModel2) {
        if let imgURL = model.imageURL {
            imageManager.getImageFromUrl(imageURL: imgURL)
        }
        else {
            view.setPlaceholder()
        }
    }
    
    func viewIsReady() {
        view.setPlaceholder()
    }
    
    //MARK: - ImageManagerDelegate
    
    func getNotificationImage(image: ImageModel) {
        view.setLastNotificationImage(image: image.image)
    }
        
}
