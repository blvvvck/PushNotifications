//
//  NotificationView.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 31/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationView: UIView {
        
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var notificationImage: UIImageView!
    
    @IBOutlet weak var notificationTitle: UILabel!
    
    @IBOutlet weak var notificationBody: UITextView!

    @IBOutlet weak var notificationBodyLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("NotificationView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowOpacity = 0.7
        contentView.layer.shadowRadius = 4.0
        
        
        
    }
    
    func setUpNotification(title: String, body: String, image: UIImage) {
        notificationTitle.text = title
        notificationBodyLabel.text = body
        notificationImage.image = image
    }
    
    @IBAction func notificationTapped(_ sender: Any) {
        print("Tapped!")
    }
    
    
}
