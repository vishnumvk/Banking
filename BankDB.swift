//
//  BankDB.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation

class BankDB: TransactionsDB,UserDB{
    
    
    var transactionDB : [String : [Transaction]]=[:]
    var userDB: [String  : User] = [:]
    
    
    func logTNX(accNo: String, _ tnx: Transaction) {
        
    }
    
    func getTransactionsOf(accNo: String) -> [Transaction]? {
        return nil
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
