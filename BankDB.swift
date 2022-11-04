//
//  BankDB.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation

class BankDB: TransactionsDB,UserDB,UserServicesDB{
    
    private init(){
    }
    
    static let db = BankDB()
    
    var transactionDB : [String : [Transaction]]=[:]
    var userDB: [String  : User] = [:]
    var accDB: [String : SavingsAccount] = [:]
    
    
    func getSavingsAccount(userID: String) -> SavingsAccount {
        return accDB[userID, default: SavingsAccount(accountNumber: "newAcc", IFSC: "sample001", balance: 1000)]
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
