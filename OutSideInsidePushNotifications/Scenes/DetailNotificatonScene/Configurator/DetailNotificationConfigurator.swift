//
//  DetailNotificationConfigurator.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationConfigurator {
    
    static func setUpModule(with viewController: DetailNotificationViewController) {
        
        let presenter = DetailNotificationPresenter()
        let dbManager = DBManagerImplemetation()
        presenter.view = viewController
        presenter.dbManager = dbManager
        viewController.presenter = presenter
        let imageManager = ImageManager(delegate: presenter)
        presenter.imageManager = imageManager
    }
    
}
