//
//  NotificationsPresenterImplementation.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import RealmSwift

class NotificationsPresenterImplementation: NotificationsPresenter, NotificationListDataSourceDelegate {
    
    weak var view: NotificationsView!
    var dbManager: DBManager!
    var notificationsDataSource: NotificationListDataSource!
    var router: NotificationsViewRouter!
    
    lazy var notifications: Results<NotificationModel> = { dbManager.getDataFromDB() }()
    
    var numberOfNotifications: Int {
        return notifications.count
    }
    
    func viewIsReady() {
        view.setUpView()
        notificationsDataSource.notificationsResults = notifications
        handleNotificationsReceived(notifications)
    }
    
    func viewDidAppear() {
        handleNotificationsReceived(notifications)
    }
    
    fileprivate func handleNotificationsReceived(_ notifications: Results<NotificationModel>) {
        self.notifications = notifications
        view.refreshNotificationsView()
    }
    
    func didTapOnCell(with row: Int) {
        view.setRow(number: row)
        router.presentDetailNotification(for: row)
    }
    
}
