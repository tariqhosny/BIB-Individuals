//
//  Helper.swift
//  Optics Index
//
//  Created by Urgent on 9/13/20.
//  Copyright © 2020 Urgent. All rights reserved.
//

import UIKit

class Helper {
    
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
    
    class func restart(){
        let scene = SceneDelegate()
        guard let window = UIApplication.shared.keyWindow else {return}
        scene.start(window: window)
    }
}
