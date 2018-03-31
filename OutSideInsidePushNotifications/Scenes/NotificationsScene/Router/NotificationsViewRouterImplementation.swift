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
    let detailViewControllerIdentifier = "DetailNotificationViewController"
    let storyboardName = "Main"
    
    init(_ notificationViewController: NotificationsViewController) {
        self.notificationsViewController = notificationViewController
    }
    
    func presentDetailNotification(for row: Int) {
        let nextVC = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: detailViewControllerIdentifier) as! DetailNotificationViewController
        nextVC.row = row
        if let tableViewController = notificationsViewController {
            tableViewController.present(nextVC, animated: true, completion: nil)
        }
    }
    
}
