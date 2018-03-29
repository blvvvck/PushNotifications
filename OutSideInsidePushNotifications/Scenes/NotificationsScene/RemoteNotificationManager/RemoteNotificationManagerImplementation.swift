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
            
            guard let currentBody = parseModel.aps.alert.body, let currentImageUrl = parseModel.data.attachmentUrl else {
                
                let model = NotificationModel(value: ["imageUrl": "", "title": "\(parseModel.aps.alert.title)", "body": "" ])
                dbManager.addData(object: model)
                return
            }
            
            let model = NotificationModel(value: ["imageUrl": "\(currentImageUrl)", "title": "\(parseModel.aps.alert.title)", "body": "\(currentBody)" ])
            
            dbManager.addData(object: model)
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
}
