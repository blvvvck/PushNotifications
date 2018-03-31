//
//  RemoteNotificationManagerImplementation.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UserNotifications

class RemoteNotificationManagerImplementation: RemoteNotificationManager {
    
    let dbManager = DBManagerImplemetation()
    
    func handleNotification(with userInfo: [AnyHashable : Any]) {
        
        do {
            let data = try JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted)
            let parseModel = try JSONDecoder().decode(ParseNotificationModel.self, from: data)
            
            if let currentBody = parseModel.aps.alert.body, let currentImageUrl = parseModel.data.attachmentUrl {
                let model = NotificationModel(value: ["imageUrl": "\(currentImageUrl)", "title": "\(parseModel.aps.alert.title)", "body": "\(currentBody)" ])
                
                dbManager.addData(object: model)
            } else if let currentBody = parseModel.aps.alert.body {
                let model = NotificationModel(value: ["imageUrl": "", "title": "\(parseModel.aps.alert.title)", "body": "\(currentBody)" ])
                dbManager.addData(object: model)
            } else if let currentImageUrl = parseModel.data.attachmentUrl {
                let model = NotificationModel(value: ["imageUrl": "\(currentImageUrl)", "title": "\(parseModel.aps.alert.title)", "body": "" ])
                dbManager.addData(object: model)
            } else {
                let model = NotificationModel(value: ["imageUrl": "", "title": "\(parseModel.aps.alert.title)", "body": "" ])
                dbManager.addData(object: model)
            }
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
}
