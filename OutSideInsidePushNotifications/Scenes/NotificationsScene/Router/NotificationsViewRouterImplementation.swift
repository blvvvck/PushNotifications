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
    fileprivate var row: Int!
    let toDetailViewSegueIdentifier = "NotificationsToDetailNotification"
    
    init(_ notificationViewController: NotificationsViewController) {
        self.notificationsViewController = notificationViewController
    }
    
    func presentDetailNotification(for row: Int) {
        self.row = row
        DispatchQueue.main.async {
            self.notificationsViewController?.performSegue(withIdentifier: self.toDetailViewSegueIdentifier, sender: nil)
        }
        
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let notificationDetailView = segue.destination as?DetailNotificationViewController {
            notificationDetailView.row = row
        }
    }
}
