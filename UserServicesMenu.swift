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
                  2 --- withdraw
                  3 --- view transactions
                  4 --- balance check
                  """)
            let choice = InputManager.readValidInt()
            let acc = db.getSavingsAccount(userID: user.phonenumber)
            switch choice{
                
            case 1:
                let amount = InputManager.readValidAmount()
                TransactionServices(db: db).deposit(acc, amount: amount)
            case 2:
                let amount = InputManager.readValidAmount()
                TransactionServices(db: db).withdraw(acc, amount: amount)
            case 3:
                print("AccNo: \(acc.accountNumber)   Closing Balance: \(acc.balance)")
                
                if let tnxs = db.getTransactionsOf(accNo: acc.accountNumber){
                    for tnx in tnxs.reversed(){
                        print(tnx.description)
                    }
                }
               else{
                    print("no transactions..")
                }
            case 4:
                
                print("AccNo: \(acc.accountNumber)   Balance: \(acc.balance)")
            
            case 0:
                hitexit = true
                
            default :
                print("Enter a valid choice..")
            }
        }
        while(!hitexit)
        
        
        
        
        
        
        
    }
}
