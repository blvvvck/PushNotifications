//
//  DBManager.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import RealmSwift

protocol DBManager {
    
    var database:Realm { set get }
   
    
    /// Get all notifications from db
    ///
    /// - Returns: Results (Realm "array")
    func getDataFromDB() -> Results<NotificationModel>
    
    /// Save into db
    ///
    /// - Parameter object: notification model we want to add
    func addData(object: NotificationModel)
    
    /// Remove all objects from db
    func deleteAllFromDatabase()
    
    /// Delete object from db
    ///
    /// - Parameter object: notification model we want to delete
    func deleteFromDb(object: NotificationModel)
    
    
    /// Get last notification from db
    ///
    /// - Returns: notification model
    func getLastNotification() -> NotificationModel?
    
    
    /// Get notification from db by row
    ///
    /// - Parameter row: notification's row in array
    /// - Returns: notification model
    func getNotification(from row: Int) -> NotificationModel
}
