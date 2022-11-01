//
//  main.swift
//  Banking
//
//  Created by vishnu-pt6278 on 18/10/22.
//

import Foundation

let db = BankDB()

let loginManager = LoginControl(db: db)



var hitexit = false
repeat{
    
    print("""
          0 --- Exit
          1 --- Login
          2 --- Register
          """)
    let choice = InputManager.readValidInt()
    switch choice{
        //login
    case 1 :
        do{
            let ph = InputManager.readValid(promtMsg: "Enter valid phone number..", validateBy: InputManager.validatePhUsingRegex)
            try loginManager.userLogin(phoneNumber: ph)
        }
        catch LoginErrors.invalidLogin{
            print("Invalid login")
        }
        catch LoginErrors.unregisteredUser{
            print("the number is not registered..")
        }
        //register
    case 2 :
        do {
           try UserReg(db).createUser()
        }
        catch UserRegError.foundExsistingUser{
            print("found exsisting user")
        }
    case 0:
        hitexit = true
    default :
        print("Enter a valid choice..")
    }
}
while(!hitexit)
