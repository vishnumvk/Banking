//
//  MainPage.swift
//  Banking
//
//  Created by vishnu-pt6278 on 01/11/22.
//

import Foundation

enum MainPageOptions: Int{
    case exit = 0,login, register
}


class MainPage{

   static func load(){
        
       let db = BankDB.shared

        let loginManager = LoginControl(db: db)

        var hitexit = false
        repeat{
            
            print("""
                  1 --- Login
                  2 --- Register
                  0 --- Exit
                  """)
            let choice = InputManager.readValidInt()
            switch MainPageOptions(rawValue: choice){
                //login
            case .login :
                do{
                    let ph = InputManager.readValid(promtMsg: "Enter valid phone number..", validateBy: InputManager.validatePhUsingRegex)
                    let loggedInUser =  try loginManager.userLogin(phoneNumber: ph)
                    UserServicesMenu(db: BankDB.shared, user: loggedInUser).load()
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
            case .register :
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
            case .exit:
                hitexit = true
            default :
                print("Enter a valid choice..")
            }
        }
        while(!hitexit)

        
        
        
        
        
        
    }
    
    
}
