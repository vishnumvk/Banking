//
//  LoginPage.swift
//  Banking
//
//  Created by vishnu-pt6278 on 31/10/22.
//

import Foundation

enum UserRegError: Error{
    case foundExsistingUser
}



class UserReg{
    init(_ db: UserDB) {
        self.db = db
    }
    
    
    
    var db: UserDB
    
    
    
    func createUser()throws{
        let name = InputManager.readValid(promtMsg: "Enter valid name",validateBy: { name in
            
            guard name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            else{
                return false
            }
            let nameCharSet = CharacterSet(charactersIn: name)
            
            if(name.count >= 3 && name.count < 25 && nameCharSet.isSubset(of: .letters.union(.whitespaces))){
                return true
            }
            else{
                return false
            }
            
            
        })
        
        let ph = InputManager.readValid(promtMsg: "Enter valid Phone number", validateBy: InputManager.validatePhUsingRegex)
       
       if (db.getUserBy(phoneNumber: ph)) != nil{
           throw UserRegError.foundExsistingUser
       }
        
        let password = InputManager.readValid(promtMsg: "Enter valid four digit pin ",validateBy: { pin in
            let pinCharSet = CharacterSet(charactersIn: pin)
            
            if(pin.count == 4 && pinCharSet.isSubset(of: CharacterSet(charactersIn: "0123456789"))){
                return true
            }
            else{
                return false
            }
            
        })
        
        
        let user = User(name: name.trimmingCharacters(in: .whitespacesAndNewlines), phonenumber: ph, password: password)
        db.addUser(user)
    }

    
    
    
    
    
    
}
