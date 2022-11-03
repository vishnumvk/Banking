//
//  BankDB.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation

class BankDB: TransactionsDB,UserDB,UserServicesDB{
    
    
    
    var transactionDB : [String : [Transaction]]=[:]
    var userDB: [String  : User] = [:]
    var accDB: [String : SavingsAccount]
    
    
    func getSavingsAccount(userID: String) -> SavingsAccount {
       return accDB[userID]
    }
    
    
    func logTNX(accNo: String, _ tnx: Transaction) {
//        if var accPassBook = transactionDB[accNo]{
//            accPassBook.append(tnx)
//        }else{
//            transactionDB[accNo] = [tnx]
//        }
        
        transactionDB[accNo,default: [tnx]].append(tnx)
    }
    
    func getTransactionsOf(accNo: String) -> [Transaction]? {
        return transactionDB[accNo]
    }
    func addUser(_ user: User) {
        userDB[user.phonenumber] = user
    }
    
    func getUserBy(phoneNumber: String) -> User? {
        if let user = userDB[phoneNumber]{
            return user
        }
        else {
            return nil
        }
    }
    
}
