//
//  MainPage.swift
//  Banking
//
//  Created by vishnu-pt6278 on 01/11/22.
//

import Foundation










class MainPage{
    
   
    
   static func load(){
        
       let db = BankDB.db

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
//                    print("needs: implementation for successful login")
                }
                catch{
                    switch error{
                    case LoginErrors.invalidLogin:
                            print("Invalid login")
                        
                    case LoginErrors.unregisteredUser:
                            print("the number is not registered..")
                        
                    default:
                            print("error in login")
                        
                    }
                }
                //register
            case 2 :         
                do {
                   try UserReg(db).createUser()
                }
                catch{
                    switch error{
                    case UserRegErrors.foundExsistingUser:
                            print("your are an exsisting user ! try login")
                        
                    default:
                            print("error in registration")
                        
                    }
                }
            case 0:
                hitexit = true
            default :
                print("Enter a valid choice..")
            }
        }
        while(!hitexit)

        
        
        
        
        
        
    }
    
    
}
