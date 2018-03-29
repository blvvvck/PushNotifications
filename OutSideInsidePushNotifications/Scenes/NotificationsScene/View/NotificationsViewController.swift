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
    let notificationCellNibIdentifier = "NotificationTableViewCell"
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.tableView.addSubview(self.refreshControl)
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        registerCell()
    }
    
    private func registerCell() {
        let notificationCellNib = UINib(nibName: notificationCellIdentifier, bundle: nil)
        self.tableView.register(notificationCellNib, forCellReuseIdentifier: notificationCellIdentifier)
    }
    
    func refreshNotificationsView() {
        tableView.reloadData()
    }
    
    //MARK: - Refresh Method
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        presenter.viewDidLoad()
        refreshControl.endRefreshing()
    }
}
