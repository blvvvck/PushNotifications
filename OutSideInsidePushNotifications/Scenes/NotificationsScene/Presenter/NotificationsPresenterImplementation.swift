//
//  NotificationsPresenterImplementation.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import RealmSwift

class NotificationsPresenterImplementation: NotificationsPresenter {
    
    weak var view: NotificationsView!
    var dbManager: DBManager!
    var notificationsDataSource: NotificationListDataSource!
    
    lazy var notifications: Results<NotificationModel> = { dbManager.getDataFromDB() }()
    
    var numberOfNotifications: Int {
        return notifications.count
    }
    
    func viewDidLoad() {
        notifications = dbManager.getDataFromDB()
        notificationsDataSource.notificationsResults = notifications
        handleNotificationsReceived(notifications)
    }
    
    fileprivate func handleNotificationsReceived(_ notifications: Results<NotificationModel>) {
        self.notifications = notifications
        view?.refreshNotificationsView()
    }
}
