//
//  DetailNotificationRouter.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 01/04/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationRouter: DetailNotificationRouterProtocol {
    
    let notificationsTableIdentifier = "NotificationsViewController"
    let storyboardName = "Main"
    var view: DetailNotificationViewController!
    
    func presentNotificationsTable() {
        let tableVC = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: notificationsTableIdentifier) as! NotificationsViewController
        view.present(tableVC, animated: true, completion: nil)
    }
    
}
