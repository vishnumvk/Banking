//
//  LoginPage.swift
//  Banking
//
//  Created by vishnu-pt6278 on 31/10/22.
//

import Foundation

enum UserRegErrors: Error{
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
            return (name.count >= 3 && name.count < 25 && nameCharSet.isSubset(of: .letters.union(.whitespaces)))
        })
        
        let ph = InputManager.readValid(promtMsg: "Enter valid Phone number", validateBy: InputManager.validatePhUsingRegex)
       
       if (db.getUserBy(phoneNumber: ph)) != nil{
           throw UserRegErrors.foundExsistingUser
       }
        
        let password = InputManager.readValid(promtMsg: "Enter valid four digit pin ",validateBy: { pin in
            let pinCharSet = CharacterSet(charactersIn: pin)
            return (pin.count == 4 && pinCharSet.isSubset(of: CharacterSet(charactersIn: "0123456789")))
        })
        

        let user = User(name: name.trimmingCharacters(in: .whitespacesAndNewlines), phonenumber: ph, password: password)
        db.addUser(user)
        db.addSavingsAcc(userID: user.phonenumber, SavingsAccount(accountNumber: BankUtils.newSavingsAccNo(), IFSC: BankUtils.ifsc(), balance: 0.0))
    }

    
    
    
    
    
    
}
