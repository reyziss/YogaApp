//
//  InterfaceController.swift
//  YogaApp_Krasyuk_Komarov WatchKit Extension
//
//  Created by Student on 12.01.2022.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    var wcSession: WCSession!
    
    @IBOutlet weak var name: WKInterfaceLabel!
    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var timer: WKInterfaceTimer!
    
    override func awake(withContext context: Any?) {
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        let message = applicationContext["name"] as? String
        let time = applicationContext["time"] as? Double
        name.setText(message)
        timer.setDate(NSDate(timeIntervalSinceNow: time!) as Date)
        timer.start()
    }
    
    func session (_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
