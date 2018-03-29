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
   
    func getDataFromDB() -> Results<NotificationModel>
    func addData(object: NotificationModel)
    func deleteAllFromDatabase()
    func deleteFromDb(object: NotificationModel)
}
