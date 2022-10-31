//
//  Accounts.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation




protocol BankAccount{
    
    
    var accountNumber: String { get }
    var IFSC: String { get }
    var balance: Float { get set }
    
    
  
    
}




class SavingsAccount: BankAccount{
    
    let accountNumber: String
    
    let IFSC: String
    
    var balance: Float
    
     init(accountNumber: String, IFSC: String, balance: Float) {
        self.accountNumber = accountNumber
        self.IFSC = IFSC
        self.balance = balance
    }
    
    
}

class CurrentAccount: BankAccount{
    
    let accountNumber: String
    
    let IFSC: String
    
    var balance: Float
    
     init(accountNumber: String, IFSC: String, balance: Float) {
        self.accountNumber = accountNumber
        self.IFSC = IFSC
        self.balance = balance
    }
    
    
}


