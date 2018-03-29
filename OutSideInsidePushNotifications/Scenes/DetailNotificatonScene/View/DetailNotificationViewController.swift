//
//  DetailNotificationViewController.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class DetailNotificationViewController: UIViewController, DetailNotificationViewControllerProtocol {
    
    @IBOutlet weak var notificationHeader: UILabel!
    
    @IBOutlet weak var notificationImage: UIImageView!
    
    @IBOutlet weak var notificationMessage: UITextView!
    
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    var presenter: DetailNotificationPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - DetailNotificationViewControllerProtocol
    
    func setNotificationHeader(text: String) {
        notificationHeader.text = text
    }
    
    func setNotificationImage(image: ImageModel) {

        imageHeightConstraint.constant = 300
        notificationImage.image = image.image
    }
    
    func setNotificationMessage(text: String) {
        notificationMessage.text = text
    }
    
    func hideNotificationImage() {
        imageHeightConstraint.constant = 0
    }
    
}
