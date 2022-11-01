//
//  UserServices.swift
//  Banking
//
//  Created by vishnu-pt6278 on 01/11/22.
//

import Foundation

protocol UserServicesDB: TransactionsDB,UserDB{
    
    
}

class UserServices{
    
    
     init(db: UserServicesDB, user: User) {
        self.db = db
        self.user = user
    }
    
    
    
    
    var db: UserServicesDB
    var user: User
    
    
    func load(){
        
        
        var hitexit = false
        repeat{
            
            print("""
                  0 --- Exit
                  1 --- Profile
                  2 --- Deposit
                  3 --- Withdraw
                  """)
            let choice = InputManager.readValidInt()
            switch choice{
                
            
            case 0:
                hitexit = true
            default :
                print("Enter a valid choice..")
            }
        }
        while(!hitexit)
        
        
        
        
        
        
        
    }
}
