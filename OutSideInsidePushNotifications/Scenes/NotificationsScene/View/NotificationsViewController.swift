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
    var row: Int!
    
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
        presenter.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter.viewDidAppear()
    }
    
    func setUpView() {
        self.tableView.addSubview(self.refreshControl)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        registerCell()
        refreshNotificationsView()
    }
    
    private func registerCell() {
        let notificationCellNib = UINib(nibName: notificationCellNibIdentifier, bundle: nil)
        self.tableView.register(notificationCellNib, forCellReuseIdentifier: notificationCellIdentifier)
    }
    
    func refreshNotificationsView() {
        tableView.reloadData()
    }
    
    func setRow(number: Int) {
        self.row = number
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let notificationDetailView = segue.destination as? DetailNotificationViewController {
            notificationDetailView.row = row
        }
    }
    
    //MARK: - Refresh Method
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        refreshNotificationsView()
        refreshControl.endRefreshing()
    }
}
