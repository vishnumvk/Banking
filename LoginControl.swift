//
//  LoginControl.swift
//  Banking
//
//  Created by vishnu-pt6278 on 01/11/22.
//

import Foundation


protocol UserDB{
    
    
    func addUser(_ user: User)
    func addSavingsAcc(userID: String,_ newAcc: SavingsAccount)
    func getUserBy(phoneNumber: String)->User?
    
}

enum LoginErrors: Error{
    
    case unregisteredUser
    case invalidLogin
}

class LoginControl{
    
    var db : UserDB
    
    init(db: UserDB) {
        self.db = db
    }
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
    
    
    func userLogin(phoneNumber: String)throws->User{
        guard let user = db.getUserBy(phoneNumber: phoneNumber)
        else{
            throw LoginErrors.unregisteredUser
        }
        if validateLogin(user){
            return user
        }
        else{
            throw LoginErrors.invalidLogin
        }
    }
    
}
