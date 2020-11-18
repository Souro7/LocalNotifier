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
        
            let content = UNMutableNotificationContent()
            content.title = "Notification Title"
            content.body = " Notification Body"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

