//
//  HCSingUpViewController.swift
//  App_SingUp_Login
//
//  Created by CICE on 7/4/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import Parse

class HCSignUpViewController: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet var activityIndicatorWaitingSingUp: UIActivityIndicatorView!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldTelefono: UITextField!
    @IBOutlet weak var textFieldCP: UITextField!
    
    //MARK: - ACTIONS
    @IBAction func doSingUp(sender: AnyObject) {
        var errorString = ""
        
        if (textFieldUsername.text == "" || textFieldPassword.text == "" || textFieldEmail.text == "" || textFieldTelefono.text == "" || textFieldCP.text == ""){
            errorString = "Es necesario rellenar todos los datos"
        } else {
            //para que se mueva la ruleta del activity
            activityIndicatorWaitingSingUp.hidden = false
            activityIndicatorWaitingSingUp.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            let user = PFUser()
            user.username = textFieldUsername.text
            user.password = textFieldPassword.text
            user.email = textFieldEmail.text
            // other fields can be set just like with PFObject
            user["phone"] = textFieldTelefono.text
            user["postal_code"] = textFieldCP.text
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                
                self.activityIndicatorWaitingSingUp.hidden = true
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if let error = error {
                    //errorString = (error.userInfo["error"] as? String)!
                    if let errorS = error.userInfo["error"] as? String {
                        errorString = errorS
                    } else {
                        errorString = "Error de conexión, intentélo de nuevo más tarde"
                    }
                } else {
                    self.textFieldCP.text = ""
                    self.textFieldEmail.text = ""
                    self.textFieldPassword.text = ""
                    self.textFieldTelefono.text = ""
                    self.textFieldUsername.text = ""
                }
                
            }
        }
        
        if (errorString != "") {
            displayAlertViewController("Error en el registro", messageData: errorString)
        } else {
            displayAlertViewController("Registrado", messageData: "El usuario se ha registrado correctamente")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Aquí bajamos el teclado
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func displayAlertViewController(titleData: String, messageData: String) {
        let alertVC = UIAlertController(title: titleData, message: messageData, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
    }

}
