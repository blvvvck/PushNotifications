//
//  ParseNotificationModel.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

struct ParseNotificationModel: Codable {
    
    struct Aps: Codable {
        struct Alert: Codable {
            let title: String
            let body: String?
        }
        let alert: Alert
    }
    let aps: Aps
    
    struct Data: Codable {
        let attachmentUrl: String?
    }
    let data: Data
}
