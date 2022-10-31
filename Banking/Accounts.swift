//
//  Accounts.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation


class User{
    
    var name: String
    var phonenumber: String
    var password: String
    
    
    public init(name: String, phonenumber: String, password: String) {
        self.name = name
        self.phonenumber = phonenumber
        self.password = password
    }
}


extension User: Hashable
{
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(password)
        hasher.combine(phonenumber)
    }
    
    static func == (lhs:User,rhs:User) -> Bool
    {
        return lhs.hashValue == rhs.hashValue
    }
}



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



