//
//  DetailNotificationInitializer.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class DetailNotificationInitializer: NSObject {
    
    @IBOutlet weak var viewController: DetailNotificationViewController!
    
    override func awakeFromNib() {
        let _ = DetailNotificationConfigurator.setUpModule(with: viewController)
    }
    
}

