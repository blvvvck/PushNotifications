//
//  NotificationTableViewCell.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 28/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit
import SDWebImage

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var notificationBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func prepare(with notificationModel: NotificationModel) {
        notificationBodyLabel.text = notificationModel.body
        notificationTitleLabel.text = notificationModel.title
        guard let imageStringAddress = notificationModel.imageUrl else { return }
        guard let imageUrl = URL(string: imageStringAddress) else { return }
        notificationImage.sd_setImage(with: imageUrl, completed: nil)
    }
    
}
