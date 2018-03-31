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
    
    let notificationCellIdentifier = "notificationCell"
    var notificationsResults: Results<NotificationModel>? = nil
    let rowHeight: CGFloat = 98
    
    override init() {
        super.init()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let notificationsCount = notificationsResults?.count else { return 0 }
        return notificationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCellIdentifier, for: indexPath) as! NotificationTableViewCell
        
        if let notifications = notificationsResults {
            let model = notifications.reversed()[indexPath.row]
            cell.prepare(with: model)
            return cell
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
