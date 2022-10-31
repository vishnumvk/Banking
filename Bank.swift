//
//  Bank.swift
//  Banking
//
//  Created by vishnu-pt6278 on 20/10/22.
//

import Foundation

class Bank{
    
    
    let name: String
    let bankDB: BankDB
    let transactionManager: TransactionServices
    
    public init(name: String, bankDB: BankDB, transactionManager: TransactionServices) {
        self.name = name
        self.bankDB = bankDB
        self.transactionManager = transactionManager
    }
    
}
