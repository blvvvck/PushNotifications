//
//  NotificationModel.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import RealmSwift

class NotificationModel: Object {
    
    @objc dynamic var imageUrl: String?
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""

}
