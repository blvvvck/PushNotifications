//
//  LastNotificationImageViewController.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class LastNotificationImageViewController: UIViewController, LastNotificationImageViewControllerProtocol {
    
    @IBOutlet weak var lastNotificationImage: UIImageView!
    
    var presenter: LastNotificationImagePresenterProtocol!
    
    var placeholderImage = UIImage(named: "Placeholder")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter.getLastNotification()
    }
    
    //MARK: - LastNotificationImageViewControllerProtocol
    
    func setLastNotificationImage(image: UIImage) {
        lastNotificationImage.image = image
    }
    
    func setPlaceholder() {
        lastNotificationImage.image = placeholderImage
    }
    
}
