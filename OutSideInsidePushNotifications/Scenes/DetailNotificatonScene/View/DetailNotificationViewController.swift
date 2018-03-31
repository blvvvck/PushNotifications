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
    
    var row: Int!
    var presenter: DetailNotificationPresenterProtocol!
    var imageHeightConstraintConst: CGFloat = 300
    var zeroheightConstraintConst: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.prepareView(with: row)
    }
    
    //MARK: - DetailNotificationViewControllerProtocol
    
    func setNotificationHeader(text: String) {
        notificationHeader.text = text
    }
    
    func setNotificationImage(image: UIImage) {
        imageHeightConstraint.constant = imageHeightConstraintConst
        notificationImage.image = image
    }
    
    func setNotificationMessage(text: String) {
        notificationMessage.text = text
    }
    
    func hideNotificationImage() {
        imageHeightConstraint.constant = zeroheightConstraintConst
    }
    
    //MARK: - Swipe Gesture Recognizer
    
    @IBAction func swipeToNotificationsTable(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizerDirection.right {
            presenter.didSwiped()
        }
    }
    
}
