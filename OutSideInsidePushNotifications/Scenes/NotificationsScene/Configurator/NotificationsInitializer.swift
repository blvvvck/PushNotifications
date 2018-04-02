//
//  NotificationsInitializer.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationsInitializer: NSObject {

    @IBOutlet weak var viewController: NotificationsViewController!
    
    override func awakeFromNib() {
        
        let _ = NotificationConfigurator.setupModule(with: viewController)
    }
}
