//
//  NotificationsConfigurator.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationConfigurator {
    
    static func setupModule(with viewController: NotificationsViewController) {
        
        let presenter = NotificationsPresenterImplementation()
        let dbManager = DBManagerImplemetation()
        let dataSource = NotificationListDataSource()
                
        viewController.presenter = presenter
        viewController.dataSource = dataSource
        
        presenter.view = viewController
        presenter.dbManager = dbManager
        presenter.notificationsDataSource = dataSource        
    }
}
