//
//  NotificationsViewController.swift
//  OutSideInsidePushNotifications
//
//  Created by BLVCK on 26/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, NotificationsView {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: NotificationListDataSource!
    let notificationCellIdentifier = "notificationCell"
    var presenter: NotificationsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //presenter = NotificationsPresenterImplementation()
        presenter.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        registerCell()
    }
    
    private func registerCell() {
        let newsCellNib = UINib(nibName: "NotificationTableViewCell", bundle: nil)
        self.tableView.register(newsCellNib, forCellReuseIdentifier: notificationCellIdentifier)
    }
    
    func refreshNotificationsView() {
        tableView.reloadData()
    }


}
