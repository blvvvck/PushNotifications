//
//  AppDelegate.swift
//  OutSideInsidePushNotifications
//
//  Created by Ildar Zalyalov on 25.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var remoteNotificationManager = RemoteNotificationManagerImplementation()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        registerForPushNotifications()
       
        if let userInfo =  launchOptions?[UIApplicationLaunchOptionsKey.remoteNotification] as? [AnyHashable: Any] {
            
            remoteNotificationManager.handleNotification(with: userInfo)
            self.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: { (_)  in  })
        }
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { [weak self] (isRegistered, error) in
            
            guard let strongSelf = self else { return }
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            strongSelf.getPushNotificationsConfigurations()
        }
    }
    
    func getPushNotificationsConfigurations() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            
            guard settings.authorizationStatus == .authorized else { return }
            
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device token: \(token)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register push notifications")
        print(error.localizedDescription)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.alert)
    }
    
    var notifView = UIView()
    
    @objc func dismissNotifFromScreen() {
        UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseIn, animations: {() -> Void in
            self.notifView.frame = CGRect(x: 0, y: -70, width: (self.window?.frame.size.width)!, height: 60)
        }, completion: {(_ finished: Bool) -> Void in
        })
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        //открыто
        if (application.applicationState == .active) {
            remoteNotificationManager.handleNotification(with: userInfo)
            
            notifView = UIView(frame: CGRect(x: 10, y: -70, width: (window?.frame.size.width)!, height: 80))
            let myView = NotificationView()
            myView.setUpNotification(title: "Notif title", body: "Body", image: UIImage(named: "Placeholder")!)

            notifView.addSubview(myView)
            window!.addSubview(notifView)

            UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseIn, animations: {() -> Void in
                self.notifView.frame = CGRect(x: 30, y: 30, width: (self.window?.frame.size.width)!, height: 60)
            }, completion: {(_ finished: Bool) -> Void in
            })
            
//            //Remove from top view after 5 seconds
//            perform(#selector(self.dismissNotifFromScreen), with: nil, afterDelay: 5.0)
//            return
            
           //говорим локальному
         //бэкграунд
        } else if (application.applicationState == .background) {
            remoteNotificationManager.handleNotification(with: userInfo)
        }
        else if (application.applicationState == .inactive) {
            remoteNotificationManager.handleNotification(with: userInfo)
        }
    }
    
}

