//
//  ImageManager.swift
//  OutSideInsidePushNotifications
//
//  Created by Elina on 29/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import SDWebImage

class ImageManager: ImageManagerProtocol {
    
    var delegate: ImageManagerDelegate
    var manager: SDWebImageManager!

    init(delegate: ImageManagerDelegate) {
        self.delegate = delegate
        self.manager = SDWebImageManager.shared()
    }

    func getImageFromUrl(imageURL: URL) {
        self.manager.imageDownloader?.downloadImage(with: imageURL,
                                                    options: SDWebImageDownloaderOptions.highPriority,
                                                    progress: nil,
                                                    completed: { (image, data, error, finished) in
                                                        if (finished && error == nil), let image = image {
                                                            let imageModel = ImageModel(image: image)
                                                            self.delegate.getNotificationImage(image: imageModel)
                                                        }
        })
    }
}
