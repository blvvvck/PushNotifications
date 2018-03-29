//
//  NotificationListDataSource.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class NotificationListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate  {
    
    //var dbManager: DBManager!
    let notificationCellIdentifier = "notificationCell"
    var notificationsResults: Results<NotificationModel>? = nil
    
    override init() {
        super.init()
        //dbManager = DBManagerImplemetation()
//        let test2 = NotificationModel(value: ["imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVHnduiEy1vr-JySv1ekN_lSccJ0SdVQqYR0ZDYAxstNW_MDej", "title": "notification title", "body": "notificationBody"])
//        let test3 = NotificationModel(value: ["imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVHnduiEy1vr-JySv1ekN_lSccJ0SdVQqYR0ZDYAxstNW_MDej", "title": "notification title2", "body": "notificationBody2"])
//        let test4 = NotificationModel(value: ["imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVHnduiEy1vr-JySv1ekN_lSccJ0SdVQqYR0ZDYAxstNW_MDej", "title": "notification title3", "body": "notificationBody3"])
//        dbManager.addData(object: test3)
//        dbManager.addData(object: test4)
//        models = dbManager.getDataFromDB()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let notificationsCount = notificationsResults?.count else { return 0 }
        return notificationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCellIdentifier, for: indexPath) as! NotificationTableViewCell
        
        if let notifications = notificationsResults {
            let model = notifications[indexPath.row]
            cell.prepare(with: model)
            return cell
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
}
