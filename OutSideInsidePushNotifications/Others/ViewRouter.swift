//
//  ViewRouter.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 31/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol ViewRouter {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension ViewRouter {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
