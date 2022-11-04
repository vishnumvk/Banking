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
    var balance: Double { get set }
    
    
  
    
}




class SavingsAccount: BankAccount,Codable{
    
    let accountNumber: String
    
    let IFSC: String
    
    var balance: Double
    
     init(accountNumber: String, IFSC: String, balance: Double) {
        self.accountNumber = accountNumber
        self.IFSC = IFSC
        self.balance = balance
    }
    
    
}

class CurrentAccount: BankAccount, Codable{
    
    let accountNumber: String
    
    let IFSC: String
    
    var balance: Double
    
     init(accountNumber: String, IFSC: String, balance: Double) {
        self.accountNumber = accountNumber
        self.IFSC = IFSC
        self.balance = balance
    }
    
    
}



