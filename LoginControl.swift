//
//  LoginControl.swift
//  Banking
//
//  Created by vishnu-pt6278 on 01/11/22.
//

import Foundation


protocol UserDB{
    
    
    func addUser(_ user: User)
    func getUserBy(phoneNumber: String)->User?
    
}

enum LoginErrors: Error{
    
    case unregisteredUser
    case invalidLogin
}

class LoginControl{
    init(db: UserDB) {
        self.db = db
    }
    
    
    var db : UserDB
    
    
    func validateLogin(_ user: User)->Bool{
        
        let pass = InputManager.readValid(promtMsg: "Enter your password..") { password in
            if password.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                return true
            }
            else{
                return false
            }
        }
        
        if user.password == pass{
            return true
        }
        return false
    }
    
    
    
    
    func userLogin(phoneNumber: String)throws{
        
//        let ph = InputManager.readValid(promtMsg: "Enter registered Number..", validateBy: InputManager.validatePhUsingRegex)
        
        guard let user = db.getUserBy(phoneNumber: phoneNumber)
        else{
            throw LoginErrors.unregisteredUser
        }
        
        
        if validateLogin(user){
            
            UserServicesMenu(db: BankDB.db, user: user).load()
        }
        else{
            throw LoginErrors.invalidLogin
        }
    }
    
}
