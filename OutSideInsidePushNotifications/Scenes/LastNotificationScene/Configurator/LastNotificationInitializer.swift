//
//  LastNotificationInitializer.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class LastNotificationInitializer: NSObject {
    
    @IBOutlet weak var viewController: LastNotificationImageViewController!
    
    override func awakeFromNib() {
        let _ = LastNotificationConfigurator.setUpModule(with: viewController)
    }
    
}
