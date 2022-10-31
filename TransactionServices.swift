//
//  TransactionManager.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation

class TransactionServices{
    
    var transactionDB : [String : [Transaction]]=[:]
    
    
    func deposit(target: inout BankAccount,amount: Float){
        target.balance += amount
        print(target.balance)
    }
    
    func withdraw(target: inout BankAccount,amount: Float){
        target.balance -= amount
        print(target.balance)
    }
    
    
    
    
    init() {
        
    }
}
