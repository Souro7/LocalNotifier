//
//  ViewController.swift
//  LocalNotifier
//
//  Created by Sourobrata Sarkar on 17/11/20.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
          UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
              (granted, error) in
              if granted {
                  print("yes")
              } else {
                  print("No")
              }
          }
    }


    @IBAction func sendNotification(_ sender: Any) {
        
//        First Notification
        let content = UNMutableNotificationContent()
        content.title = "Notification Title1"
        content.body = " Notification Body1"
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
//        Second notification
        let content1 = UNMutableNotificationContent()
        content1.title = "Notification Title2"
        content1.body = " Notification Body2"
            let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 11, repeats: false)
            let request1 = UNNotificationRequest(identifier: "notification.id.02", content: content1, trigger: trigger1)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            UNUserNotificationCenter.current().add(request1, withCompletionHandler: nil)
    }
    
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        NSLog("Notification: did receive handler")
        completionHandler()
    }
}

