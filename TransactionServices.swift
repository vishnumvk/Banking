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
        let tnx = Transaction(tID: BankUtils.newTnxId(), by: "tnxservices", date: Date(), amount: amount, type: .credit)
        print(tnx.description + "  New Balance: \(target.balance)")
        db.logTNX(accNo: target.accountNumber, tnx)
    }
    
    func withdraw(_ target: SavingsAccount,amount: Double){
        
        target.balance -= amount
        let tnx = Transaction(tID: BankUtils.newTnxId(), by: "tnxservices", date: Date(), amount: amount, type: .debit)
        print(tnx.description + "  New Balance: \(target.balance)")
        db.logTNX(accNo: target.accountNumber, tnx)
        
    }
    
    func checkBalance(_ target: SavingsAccount){
        print("your balance : \(target.balance)")
    }
    
    
    
}
