//
//  HCPushViewController.swift
//  App_SingUp_Login
//
//  Created by CICE on 7/4/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit

class HCPushViewController: UIViewController {

    
    //MARK: - IBOUTLETS
    @IBOutlet weak var labelShowMessage: UILabel!
    
    
    //MARK: - ACTIONS
    @IBAction func sendMessageToUser(sender: AnyObject) {
        labelShowMessage.text = "Dentro de 10 segundos recibirás una notificación push local"
        //notificacion
        let localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        localNotification.alertBody = "Tienes un nuevo HalCash"
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
