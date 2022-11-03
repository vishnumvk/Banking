//
//  TransactionManager.swift
//  Banking
//
//  Created by vishnu-pt6278 on 19/10/22.
//

import Foundation

protocol TransactionsDB{
    
    
    func logTNX(accNo: String,_ tnx: Transaction)
    func getTransactionsOf(accNo: String)->[Transaction]?
    
}





class TransactionServices{
    init(db: TransactionsDB) {
        self.db = db
    }
    
    
    let db : TransactionsDB
    
    
    func deposit(_ target: SavingsAccount,amount: Double){
        target.balance += amount
        db.logTNX(accNo: target.accountNumber, Transaction(TID: 5555551, by: "tnxservices", date: Date.now, amount: amount, type: .debit))
    }
    
    func withdraw(_ target: SavingsAccount,amount: Double){
        
        target.balance += amount
        db.logTNX(accNo: target.accountNumber, Transaction(TID: 5555551, by: "tnxservices", date: Date.now, amount: amount, type: .credit))
        
    }
    
    func checkBalance(_ target: SavingsAccount){
        print("your balance : \(target.balance)")
    }
    
    
    
}
