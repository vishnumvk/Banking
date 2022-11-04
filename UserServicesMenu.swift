//
//  UserServices.swift
//  Banking
//
//  Created by vishnu-pt6278 on 01/11/22.
//

import Foundation

protocol UserServicesDB: TransactionsDB,UserDB{
    
    func getSavingsAccount(userID: String)->SavingsAccount

}

class UserServicesMenu{
    
    
     init(db: UserServicesDB, user: User) {
        self.db = db
        self.user = user
    }
    
    
    
    
    let db: UserServicesDB
    let user: User
    
    
    func load(){
        
        
        var hitexit = false
        repeat{
            
            print("""
                  0 --- Exit
                  1 --- deposit
                  
                  """)
            let choice = InputManager.readValidInt()
            switch choice{
                
            case 1:
                let amount = InputManager.readValidAmount()
                TransactionServices(db: db).deposit(db.getSavingsAccount(userID: user.phonenumber), amount: amount)
                
                
            
            case 0:
                hitexit = true
                
            default :
                print("Enter a valid choice..")
            }
        }
        while(!hitexit)
        
        
        
        
        
        
        
    }
}
