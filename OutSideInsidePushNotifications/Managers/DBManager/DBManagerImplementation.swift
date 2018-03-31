//
//  DBManagerImplementation.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import RealmSwift

class DBManagerImplemetation: DBManager {
    var database: Realm
    
    init() {
        database = try! Realm()
    }
    
    func getDataFromDB() -> Results<NotificationModel> {
        let results: Results<NotificationModel> = database.objects(NotificationModel.self)
        return results
    }
    
    func addData(object: NotificationModel) {
        try! database.write {
            database.add(object)
        }
    }
    
    func deleteAllFromDatabase() {
        try!   database.write {
            database.deleteAll()
        }
    }
    
    func deleteFromDb(object: NotificationModel) {
        try! database.write {
            database.delete(object)
        }
    }
    
    func getLastNotification() -> NotificationModel? {
        let results: Results<NotificationModel> = database.objects(NotificationModel.self)
        guard let lastNotification = results.last else { return nil }
        return lastNotification
    }
    
    func getNotification(from row: Int) -> NotificationModel {
        let results: Results<NotificationModel> = database.objects(NotificationModel.self)
        let model = results[row]
        return model
    }
    
}
