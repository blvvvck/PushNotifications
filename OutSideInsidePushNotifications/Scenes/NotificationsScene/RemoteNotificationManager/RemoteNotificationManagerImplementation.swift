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
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { [weak self] (isRegistered, error) in
            
            guard let strongSelf = self else { return }
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            strongSelf.getPushNotificationsConfigurations()
        }
    }
    
    func getPushNotificationsConfigurations() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            
            guard settings.authorizationStatus == .authorized else { return }
            
            DispatchQueue.main.async {
                self.registerForPushNotifications()
            }
        }
    }
}
