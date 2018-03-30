//
//  LastNotificationConfigurator.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class LastNotificationConfigurator {
    
    static func setUpModule(with viewController: LastNotificationImageViewController) {
        
        let presenter = LastNotificationImagePresenter()
        let dbManager = DBManagerImplemetation()
        presenter.view = viewController
        viewController.presenter = presenter
        let imageManager = ImageManager(delegate: presenter)
        presenter.dbManager = dbManager
        presenter.imageManager = imageManager
        
    }
    
}
