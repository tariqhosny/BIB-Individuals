//
//  Helper.swift
//  Optics Index
//
//  Created by Urgent on 9/13/20.
//  Copyright © 2020 Urgent. All rights reserved.
//

import UIKit

class Helper {
    
    class func validateEmail(email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    class func validatePassword(password: String) -> Bool{
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    class func showAlert(title: String, message: String, _ viewController: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    class func getUserData() -> (username: String?, email: String?){
        let defUser = UserDefaults.standard
        let username = defUser.object(forKey: "username") as? String
        let email = defUser.object(forKey: "userEmail") as? String
        return (username, email)
    }
    
    class func saveUserData(username: String, email: String){
        let defUser = UserDefaults.standard
        defUser.setValue(username, forKey: "username")
        defUser.setValue(email, forKey: "userEmail")
        defUser.synchronize()
    }
    
    class func isUserLogged() -> Bool{
        if self.getUserData().email == "" || self.getUserData().email == nil{
            return false
        }else{
            return true
        }
    }
}
