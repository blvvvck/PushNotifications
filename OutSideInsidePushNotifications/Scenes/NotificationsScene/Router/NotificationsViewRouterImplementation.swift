//
//  NotificationsViewRouterImplementation.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 31/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class NotificationsViewRouterImplementation: NotificationsViewRouter {
    
    fileprivate weak var notificationsViewController: NotificationsViewController?
    let toDetailViewControllerIdentifier = "detailViewControllerIdentifier"
    let storyboardName = "Main"
    
    init(_ notificationViewController: NotificationsViewController) {
        self.notificationsViewController = notificationViewController
    }
    
    func presentDetailNotification(for row: Int) {       
        notificationsViewController?.performSegue(withIdentifier: toDetailViewControllerIdentifier, sender: nil)
    }
    
}
